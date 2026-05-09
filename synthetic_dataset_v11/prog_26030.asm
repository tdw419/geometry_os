; DESCRIPTION: Draws a white rectangle at (141, 173) with width 48 and height 60.
; PLAN: r0=141(x), r1=173(y), r2=48(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 173
LDI r2, 48
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
