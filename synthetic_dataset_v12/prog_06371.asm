; DESCRIPTION: Draws a cyan rectangle at (3, 28) with width 39 and height 75.
; PLAN: r0=3(x), r1=28(y), r2=39(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 28
LDI r2, 39
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
