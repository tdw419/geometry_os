; DESCRIPTION: Draws a red rectangle at (286, 54) with width 86 and height 42.
; PLAN: r0=286(x), r1=54(y), r2=86(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 54
LDI r2, 86
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
