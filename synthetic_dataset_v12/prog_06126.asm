; DESCRIPTION: Draws a cyan rectangle at (335, 32) with width 26 and height 73.
; PLAN: r0=335(x), r1=32(y), r2=26(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 32
LDI r2, 26
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
