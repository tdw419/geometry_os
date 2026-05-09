; DESCRIPTION: Draws a red rectangle at (89, 1) with width 86 and height 42.
; PLAN: r0=89(x), r1=1(y), r2=86(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 1
LDI r2, 86
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
