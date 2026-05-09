; DESCRIPTION: Composite: . Then Creates a red rectangular region at (173, 41) spanning 18 by 48 pixels. Then Renders a cyan disk with center (105, 78) and radius 74.
; PLAN: r0=173(x), r1=41(y), r2=18(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=105(x), r1=78(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (173, 41) spanning 18 by 48 pixels.
; PLAN: r0=173(x), r1=41(y), r2=18(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 41
LDI r2, 18
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (105, 78) and radius 74.
; PLAN: r0=105(x), r1=78(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 78
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
