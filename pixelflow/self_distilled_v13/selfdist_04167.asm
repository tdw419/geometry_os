; DESCRIPTION: Draws a red rectangle at (33, 164) with width 23 and height 42.
; PLAN: r0=33(x), r1=164(y), r2=23(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 164
LDI r2, 23
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
