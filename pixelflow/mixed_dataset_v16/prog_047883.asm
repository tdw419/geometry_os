; DESCRIPTION: Draws a cyan rectangle at (93, 26) with width 86 and height 24.
; PLAN: r0=93(x), r1=26(y), r2=86(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 26
LDI r2, 86
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
