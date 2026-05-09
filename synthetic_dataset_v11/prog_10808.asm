; DESCRIPTION: Draws a cyan rectangle at (101, 23) with width 93 and height 87.
; PLAN: r0=101(x), r1=23(y), r2=93(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 23
LDI r2, 93
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
