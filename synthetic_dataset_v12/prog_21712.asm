; DESCRIPTION: Draws a cyan rectangle at (162, 181) with width 44 and height 16.
; PLAN: r0=162(x), r1=181(y), r2=44(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 181
LDI r2, 44
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
