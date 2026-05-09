; DESCRIPTION: Composite: . Then Renders a white line between points (18, 192) and (191, 192). Then Places a magenta dot at position (49, 168).
; PLAN: r0=18(x1), r1=192(y1), r2=191(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=49(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (18, 192) and (191, 192).
; PLAN: r0=18(x1), r1=192(y1), r2=191(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 192
LDI r2, 191
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (49, 168).
; PLAN: r0=49(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 168
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
