; DESCRIPTION: Draws a cyan rectangle at (184, 58) with width 23 and height 40.
; PLAN: r0=184(x), r1=58(y), r2=23(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 58
LDI r2, 23
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
