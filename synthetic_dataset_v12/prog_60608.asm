; DESCRIPTION: Draws a red rectangle at (281, 49) with width 42 and height 85.
; PLAN: r0=281(x), r1=49(y), r2=42(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 49
LDI r2, 42
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
