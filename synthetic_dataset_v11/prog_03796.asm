; DESCRIPTION: Draws a red rectangle at (18, 109) with width 32 and height 39.
; PLAN: r0=18(x), r1=109(y), r2=32(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 109
LDI r2, 32
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
