; DESCRIPTION: Composite: . Then Places a black line segment connecting (16, 65) to (75, 96). Then Creates a green circular shape at (107, 215) with radius 20.
; PLAN: r0=16(x1), r1=65(y1), r2=75(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=107(x), r1=215(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (16, 65) to (75, 96).
; PLAN: r0=16(x1), r1=65(y1), r2=75(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 65
LDI r2, 75
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (107, 215) with radius 20.
; PLAN: r0=107(x), r1=215(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 215
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
