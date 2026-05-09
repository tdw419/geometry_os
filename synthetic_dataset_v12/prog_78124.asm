; DESCRIPTION: Draws a cyan rectangle at (72, 207) with width 100 and height 23.
; PLAN: r0=72(x), r1=207(y), r2=100(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 207
LDI r2, 100
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
