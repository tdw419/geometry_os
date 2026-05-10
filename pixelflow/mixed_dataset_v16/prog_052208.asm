; DESCRIPTION: Draws a cyan rectangle at (9, 8) with width 21 and height 40.
; PLAN: r0=9(x), r1=8(y), r2=21(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 8
LDI r2, 21
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
