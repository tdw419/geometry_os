; DESCRIPTION: Draws a red rectangle at (216, 50) with width 42 and height 119.
; PLAN: r0=216(x), r1=50(y), r2=42(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 50
LDI r2, 42
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
