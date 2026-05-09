; DESCRIPTION: Composite: . Then Places a white dot at position (247, 254). Then Renders a magenta line between points (204, 99) and (21, 88).
; PLAN: r0=247(x), r1=254(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=204(x1), r1=99(y1), r2=21(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (247, 254).
; PLAN: r0=247(x), r1=254(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 254
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta line between points (204, 99) and (21, 88).
; PLAN: r0=204(x1), r1=99(y1), r2=21(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 99
LDI r2, 21
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
