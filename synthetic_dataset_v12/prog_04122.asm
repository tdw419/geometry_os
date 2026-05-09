; DESCRIPTION: Draws a cyan rectangle at (160, 197) with width 99 and height 22.
; PLAN: r0=160(x), r1=197(y), r2=99(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 197
LDI r2, 99
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
