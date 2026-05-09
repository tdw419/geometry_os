; DESCRIPTION: Composite: . Then Renders a blue disk with center (122, 193) and radius 52. Then Draws a green line from (175, 16) to (173, 243).
; PLAN: r0=122(x), r1=193(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=175(x1), r1=16(y1), r2=173(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (122, 193) and radius 52.
; PLAN: r0=122(x), r1=193(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 193
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (175, 16) to (173, 243).
; PLAN: r0=175(x1), r1=16(y1), r2=173(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 16
LDI r2, 173
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
