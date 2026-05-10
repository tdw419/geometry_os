; DESCRIPTION: Draws a cyan rectangle at (315, 144) with width 32 and height 89.
; PLAN: r0=315(x), r1=144(y), r2=32(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 144
LDI r2, 32
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
