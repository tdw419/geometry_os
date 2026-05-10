; DESCRIPTION: Draws a green rectangle at (8, 168) with width 91 and height 50.
; PLAN: r0=8(x), r1=168(y), r2=91(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 168
LDI r2, 91
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
