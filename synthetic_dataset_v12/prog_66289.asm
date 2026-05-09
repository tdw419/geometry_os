; DESCRIPTION: Draws a green rectangle at (101, 120) with width 42 and height 100.
; PLAN: r0=101(x), r1=120(y), r2=42(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 120
LDI r2, 42
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
