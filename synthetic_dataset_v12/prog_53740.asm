; DESCRIPTION: Draws a cyan rectangle at (283, 58) with width 24 and height 100.
; PLAN: r0=283(x), r1=58(y), r2=24(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 58
LDI r2, 24
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
