; DESCRIPTION: Draws a black rectangle at (173, 120) with width 36 and height 65.
; PLAN: r0=173(x), r1=120(y), r2=36(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 120
LDI r2, 36
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
