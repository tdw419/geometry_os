; DESCRIPTION: Draws a cyan rectangle at (82, 99) with width 10 and height 66.
; PLAN: r0=82(x), r1=99(y), r2=10(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 99
LDI r2, 10
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
