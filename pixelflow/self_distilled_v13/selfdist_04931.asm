; DESCRIPTION: Draws a cyan rectangle at (249, 128) with width 68 and height 92.
; PLAN: r0=249(x), r1=128(y), r2=68(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 128
LDI r2, 68
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
