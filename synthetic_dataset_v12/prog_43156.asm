; DESCRIPTION: Draws a cyan rectangle at (106, 45) with width 43 and height 48.
; PLAN: r0=106(x), r1=45(y), r2=43(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 45
LDI r2, 43
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
