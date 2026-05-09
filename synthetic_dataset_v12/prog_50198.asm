; DESCRIPTION: Draws a cyan rectangle at (417, 25) with width 34 and height 45.
; PLAN: r0=417(x), r1=25(y), r2=34(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 25
LDI r2, 34
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
