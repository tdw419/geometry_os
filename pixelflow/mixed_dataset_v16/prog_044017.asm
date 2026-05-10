; DESCRIPTION: Draws a red rectangle at (369, 193) with width 53 and height 42.
; PLAN: r0=369(x), r1=193(y), r2=53(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 193
LDI r2, 53
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
