; DESCRIPTION: Draws a yellow rectangle at (164, 186) with width 98 and height 66.
; PLAN: r0=164(x), r1=186(y), r2=98(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 186
LDI r2, 98
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
