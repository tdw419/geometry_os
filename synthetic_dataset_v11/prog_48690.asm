; DESCRIPTION: Draws a cyan rectangle at (42, 89) with width 88 and height 93.
; PLAN: r0=42(x), r1=89(y), r2=88(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 89
LDI r2, 88
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
