; DESCRIPTION: Draws a cyan rectangle at (104, 115) with width 109 and height 13.
; PLAN: r0=104(x), r1=115(y), r2=109(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 115
LDI r2, 109
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
