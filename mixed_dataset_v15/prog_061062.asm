; DESCRIPTION: Draws a cyan rectangle at (189, 44) with width 21 and height 98.
; PLAN: r0=189(x), r1=44(y), r2=21(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 44
LDI r2, 21
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
