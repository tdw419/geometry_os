; DESCRIPTION: Draws a yellow rectangle at (23, 120) with width 30 and height 24.
; PLAN: r0=23(x), r1=120(y), r2=30(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 120
LDI r2, 30
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
