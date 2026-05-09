; DESCRIPTION: Draws a yellow rectangle at (220, 23) with width 108 and height 42.
; PLAN: r0=220(x), r1=23(y), r2=108(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 23
LDI r2, 108
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
