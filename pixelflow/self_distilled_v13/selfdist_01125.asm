; DESCRIPTION: Draws a cyan rectangle at (389, 20) with width 96 and height 87.
; PLAN: r0=389(x), r1=20(y), r2=96(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 20
LDI r2, 96
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
