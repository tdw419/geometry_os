; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (152, 160) with radius 56. Then Renders a black line between points (175, 86) and (173, 155).
; PLAN: r0=152(x), r1=160(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=175(x1), r1=86(y1), r2=173(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (152, 160) with radius 56.
; PLAN: r0=152(x), r1=160(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 160
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (175, 86) and (173, 155).
; PLAN: r0=175(x1), r1=86(y1), r2=173(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 86
LDI r2, 173
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
