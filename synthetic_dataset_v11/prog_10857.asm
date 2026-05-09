; DESCRIPTION: Draws a cyan rectangle at (19, 195) with width 16 and height 11.
; PLAN: r0=19(x), r1=195(y), r2=16(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 195
LDI r2, 16
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
