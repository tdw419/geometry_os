; DESCRIPTION: Draws a cyan rectangle at (38, 13) with width 68 and height 22.
; PLAN: r0=38(x), r1=13(y), r2=68(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 13
LDI r2, 68
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
