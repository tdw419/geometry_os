; DESCRIPTION: Draws a green rectangle at (68, 47) with width 120 and height 70.
; PLAN: r0=68(x), r1=47(y), r2=120(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 47
LDI r2, 120
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
