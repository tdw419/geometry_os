; DESCRIPTION: Draws a cyan rectangle at (184, 12) with width 33 and height 103.
; PLAN: r0=184(x), r1=12(y), r2=33(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 12
LDI r2, 33
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
