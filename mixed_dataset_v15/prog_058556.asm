; DESCRIPTION: Draws a cyan rectangle at (218, 91) with width 90 and height 26.
; PLAN: r0=218(x), r1=91(y), r2=90(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 91
LDI r2, 90
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
