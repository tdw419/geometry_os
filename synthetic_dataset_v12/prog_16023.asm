; DESCRIPTION: Draws a cyan rectangle at (99, 42) with width 44 and height 36.
; PLAN: r0=99(x), r1=42(y), r2=44(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 42
LDI r2, 44
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
