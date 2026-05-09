; DESCRIPTION: Composite: . Then Creates a red rectangular region at (128, 69) spanning 99 by 115 pixels. Then Renders a cyan disk with center (132, 77) and radius 34.
; PLAN: r0=128(x), r1=69(y), r2=99(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=132(x), r1=77(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (128, 69) spanning 99 by 115 pixels.
; PLAN: r0=128(x), r1=69(y), r2=99(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 69
LDI r2, 99
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (132, 77) and radius 34.
; PLAN: r0=132(x), r1=77(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 77
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
