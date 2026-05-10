; DESCRIPTION: Draws a red rectangle at (265, 154) with width 16 and height 102.
; PLAN: r0=265(x), r1=154(y), r2=16(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 154
LDI r2, 16
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
