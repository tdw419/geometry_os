; DESCRIPTION: Draws a cyan rectangle at (137, 74) with width 32 and height 76.
; PLAN: r0=137(x), r1=74(y), r2=32(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 74
LDI r2, 32
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
