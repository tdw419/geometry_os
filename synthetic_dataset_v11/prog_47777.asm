; DESCRIPTION: Draws a cyan rectangle at (110, 58) with width 114 and height 42.
; PLAN: r0=110(x), r1=58(y), r2=114(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 58
LDI r2, 114
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
