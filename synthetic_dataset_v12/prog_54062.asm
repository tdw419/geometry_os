; DESCRIPTION: Draws a cyan rectangle at (167, 48) with width 99 and height 108.
; PLAN: r0=167(x), r1=48(y), r2=99(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 48
LDI r2, 99
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
