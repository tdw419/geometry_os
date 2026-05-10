; DESCRIPTION: Draws a green rectangle at (168, 58) with width 91 and height 100.
; PLAN: r0=168(x), r1=58(y), r2=91(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 58
LDI r2, 91
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
