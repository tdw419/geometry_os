; DESCRIPTION: Draws a cyan rectangle at (45, 199) with width 25 and height 16.
; PLAN: r0=45(x), r1=199(y), r2=25(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 199
LDI r2, 25
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
