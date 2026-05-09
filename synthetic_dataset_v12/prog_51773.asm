; DESCRIPTION: Draws a orange rectangle at (243, 186) with width 95 and height 40.
; PLAN: r0=243(x), r1=186(y), r2=95(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 186
LDI r2, 95
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
