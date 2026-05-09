; DESCRIPTION: Draws a cyan rectangle at (83, 128) with width 13 and height 10.
; PLAN: r0=83(x), r1=128(y), r2=13(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 128
LDI r2, 13
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
