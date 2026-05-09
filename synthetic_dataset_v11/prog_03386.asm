; DESCRIPTION: Composite: . Then Places a magenta dot at position (91, 214). Then Renders a purple line between points (128, 62) and (112, 59).
; PLAN: r0=91(x), r1=214(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=128(x1), r1=62(y1), r2=112(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (91, 214).
; PLAN: r0=91(x), r1=214(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 214
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (128, 62) and (112, 59).
; PLAN: r0=128(x1), r1=62(y1), r2=112(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 62
LDI r2, 112
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
