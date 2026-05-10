; DESCRIPTION: Draws a red rectangle at (73, 138) with width 45 and height 32.
; PLAN: r0=73(x), r1=138(y), r2=45(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 138
LDI r2, 45
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
