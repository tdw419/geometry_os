; DESCRIPTION: Draws a cyan rectangle at (129, 58) with width 50 and height 119.
; PLAN: r0=129(x), r1=58(y), r2=50(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 58
LDI r2, 50
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
