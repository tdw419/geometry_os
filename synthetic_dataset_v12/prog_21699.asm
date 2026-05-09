; DESCRIPTION: Draws a cyan rectangle at (188, 33) with width 21 and height 105.
; PLAN: r0=188(x), r1=33(y), r2=21(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 33
LDI r2, 21
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
