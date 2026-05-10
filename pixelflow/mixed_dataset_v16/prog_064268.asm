; DESCRIPTION: Draws a cyan rectangle at (29, 64) with width 21 and height 73.
; PLAN: r0=29(x), r1=64(y), r2=21(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 64
LDI r2, 21
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
