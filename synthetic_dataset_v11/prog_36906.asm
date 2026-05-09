; DESCRIPTION: Composite: . Then Renders a red disk with center (180, 78) and radius 18. Then Renders a yellow line between points (178, 244) and (76, 5).
; PLAN: r0=180(x), r1=78(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=178(x1), r1=244(y1), r2=76(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (180, 78) and radius 18.
; PLAN: r0=180(x), r1=78(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 78
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (178, 244) and (76, 5).
; PLAN: r0=178(x1), r1=244(y1), r2=76(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 244
LDI r2, 76
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
