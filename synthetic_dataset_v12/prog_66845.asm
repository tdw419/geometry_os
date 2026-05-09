; DESCRIPTION: Draws a cyan rectangle at (171, 56) with width 99 and height 12.
; PLAN: r0=171(x), r1=56(y), r2=99(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 56
LDI r2, 99
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
