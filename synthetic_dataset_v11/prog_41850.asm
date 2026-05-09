; DESCRIPTION: Composite: . Then Renders a black disk with center (132, 108) and radius 76. Then Places a orange line segment connecting (243, 253) to (50, 118).
; PLAN: r0=132(x), r1=108(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=243(x1), r1=253(y1), r2=50(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (132, 108) and radius 76.
; PLAN: r0=132(x), r1=108(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 108
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (243, 253) to (50, 118).
; PLAN: r0=243(x1), r1=253(y1), r2=50(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 253
LDI r2, 50
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
