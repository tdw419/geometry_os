; DESCRIPTION: Draws a cyan rectangle at (428, 59) with width 11 and height 66.
; PLAN: r0=428(x), r1=59(y), r2=11(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 59
LDI r2, 11
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
