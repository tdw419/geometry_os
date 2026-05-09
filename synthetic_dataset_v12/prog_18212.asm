; DESCRIPTION: Draws a cyan rectangle at (138, 14) with width 74 and height 42.
; PLAN: r0=138(x), r1=14(y), r2=74(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 14
LDI r2, 74
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
