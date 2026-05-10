; DESCRIPTION: Draws a cyan rectangle at (146, 22) with width 25 and height 15.
; PLAN: r0=146(x), r1=22(y), r2=25(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 22
LDI r2, 25
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
