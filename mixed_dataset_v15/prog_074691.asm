; DESCRIPTION: Draws a cyan rectangle at (211, 21) with width 39 and height 23.
; PLAN: r0=211(x), r1=21(y), r2=39(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 21
LDI r2, 39
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
