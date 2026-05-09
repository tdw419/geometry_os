; DESCRIPTION: Draws a cyan rectangle at (160, 99) with width 59 and height 36.
; PLAN: r0=160(x), r1=99(y), r2=59(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 99
LDI r2, 59
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
