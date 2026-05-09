; DESCRIPTION: Composite: . Then Renders a cyan disk with center (132, 135) and radius 73. Then Creates a purple rectangular region at (105, 133) spanning 96 by 60 pixels.
; PLAN: r0=132(x), r1=135(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=105(x), r1=133(y), r2=96(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (132, 135) and radius 73.
; PLAN: r0=132(x), r1=135(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 135
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (105, 133) spanning 96 by 60 pixels.
; PLAN: r0=105(x), r1=133(y), r2=96(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 133
LDI r2, 96
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
