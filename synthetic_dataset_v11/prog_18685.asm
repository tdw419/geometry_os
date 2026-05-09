; DESCRIPTION: Draws a red rectangle at (168, 9) with width 32 and height 102.
; PLAN: r0=168(x), r1=9(y), r2=32(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 9
LDI r2, 32
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
