; DESCRIPTION: Draws a cyan rectangle at (370, 118) with width 39 and height 70.
; PLAN: r0=370(x), r1=118(y), r2=39(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 118
LDI r2, 39
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
