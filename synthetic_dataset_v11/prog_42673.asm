; DESCRIPTION: Draws a cyan rectangle at (21, 0) with width 48 and height 99.
; PLAN: r0=21(x), r1=0(y), r2=48(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 0
LDI r2, 48
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
