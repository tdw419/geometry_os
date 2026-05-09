; DESCRIPTION: Draws a red rectangle at (42, 10) with width 34 and height 80.
; PLAN: r0=42(x), r1=10(y), r2=34(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 10
LDI r2, 34
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
