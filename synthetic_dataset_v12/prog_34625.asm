; DESCRIPTION: Draws a yellow rectangle at (146, 149) with width 18 and height 105.
; PLAN: r0=146(x), r1=149(y), r2=18(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 149
LDI r2, 18
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
