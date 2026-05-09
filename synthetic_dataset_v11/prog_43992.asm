; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (173, 56) with width 73 and height 96. Then Renders a white disk with center (64, 124) and radius 24.
; PLAN: r0=173(x), r1=56(y), r2=73(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=64(x), r1=124(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (173, 56) with width 73 and height 96.
; PLAN: r0=173(x), r1=56(y), r2=73(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 56
LDI r2, 73
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (64, 124) and radius 24.
; PLAN: r0=64(x), r1=124(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 124
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
