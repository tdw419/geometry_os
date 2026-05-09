; DESCRIPTION: Draws a cyan rectangle at (237, 58) with width 12 and height 75.
; PLAN: r0=237(x), r1=58(y), r2=12(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 58
LDI r2, 12
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
