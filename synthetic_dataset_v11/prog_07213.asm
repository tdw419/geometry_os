; DESCRIPTION: Composite: . Then Draws a white circle centered at (64, 202) with radius 50. Then Renders a blue line between points (66, 175) and (128, 133).
; PLAN: r0=64(x), r1=202(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x1), r1=175(y1), r2=128(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (64, 202) with radius 50.
; PLAN: r0=64(x), r1=202(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 202
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (66, 175) and (128, 133).
; PLAN: r0=66(x1), r1=175(y1), r2=128(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 175
LDI r2, 128
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
