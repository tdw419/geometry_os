; DESCRIPTION: Draws a cyan rectangle at (45, 96) with width 75 and height 57.
; PLAN: r0=45(x), r1=96(y), r2=75(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 96
LDI r2, 75
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
