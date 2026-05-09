; DESCRIPTION: Draws a cyan rectangle at (13, 230) with width 86 and height 16.
; PLAN: r0=13(x), r1=230(y), r2=86(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 230
LDI r2, 86
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
