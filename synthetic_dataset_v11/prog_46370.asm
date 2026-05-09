; DESCRIPTION: Draws a cyan rectangle at (163, 64) with width 48 and height 99.
; PLAN: r0=163(x), r1=64(y), r2=48(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 64
LDI r2, 48
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
