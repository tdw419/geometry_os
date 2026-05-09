; DESCRIPTION: Composite: . Then Renders a magenta disk with center (124, 70) and radius 52. Then Creates a purple rectangular region at (57, 89) spanning 115 by 13 pixels.
; PLAN: r0=124(x), r1=70(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=57(x), r1=89(y), r2=115(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (124, 70) and radius 52.
; PLAN: r0=124(x), r1=70(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 70
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (57, 89) spanning 115 by 13 pixels.
; PLAN: r0=57(x), r1=89(y), r2=115(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 89
LDI r2, 115
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
