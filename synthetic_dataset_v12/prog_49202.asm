; DESCRIPTION: Draws a white rectangle at (243, 167) with width 91 and height 34.
; PLAN: r0=243(x), r1=167(y), r2=91(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 167
LDI r2, 91
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
