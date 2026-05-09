; DESCRIPTION: Draws a black rectangle at (255, 210) with width 50 and height 27.
; PLAN: r0=255(x), r1=210(y), r2=50(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 210
LDI r2, 50
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
