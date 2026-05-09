; DESCRIPTION: Draws a cyan rectangle at (100, 143) with width 68 and height 90.
; PLAN: r0=100(x), r1=143(y), r2=68(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 143
LDI r2, 68
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
