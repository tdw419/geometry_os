; DESCRIPTION: Draws a cyan rectangle at (87, 104) with width 111 and height 20.
; PLAN: r0=87(x), r1=104(y), r2=111(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 104
LDI r2, 111
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
