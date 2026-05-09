; DESCRIPTION: Draws a cyan rectangle at (31, 13) with width 93 and height 86.
; PLAN: r0=31(x), r1=13(y), r2=93(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 13
LDI r2, 93
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
