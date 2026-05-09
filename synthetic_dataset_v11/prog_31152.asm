; DESCRIPTION: Composite: . Then Renders a magenta line between points (255, 128) and (47, 168). Then Places a orange dot at position (246, 2).
; PLAN: r0=255(x1), r1=128(y1), r2=47(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=246(x), r1=2(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (255, 128) and (47, 168).
; PLAN: r0=255(x1), r1=128(y1), r2=47(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 128
LDI r2, 47
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (246, 2).
; PLAN: r0=246(x), r1=2(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 2
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
