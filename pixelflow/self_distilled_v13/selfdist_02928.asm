; DESCRIPTION: Draws a cyan rectangle at (46, 100) with width 95 and height 23.
; PLAN: r0=46(x), r1=100(y), r2=95(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 100
LDI r2, 95
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
