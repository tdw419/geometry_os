; DESCRIPTION: Composite: . Then Places a green line segment connecting (149, 224) to (135, 242). Then Renders a red disk with center (121, 185) and radius 30.
; PLAN: r0=149(x1), r1=224(y1), r2=135(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=121(x), r1=185(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (149, 224) to (135, 242).
; PLAN: r0=149(x1), r1=224(y1), r2=135(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 224
LDI r2, 135
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (121, 185) and radius 30.
; PLAN: r0=121(x), r1=185(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 185
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
