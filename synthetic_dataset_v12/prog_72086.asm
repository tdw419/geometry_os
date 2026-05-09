; DESCRIPTION: Draws a cyan rectangle at (215, 78) with width 32 and height 36.
; PLAN: r0=215(x), r1=78(y), r2=32(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 78
LDI r2, 32
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
