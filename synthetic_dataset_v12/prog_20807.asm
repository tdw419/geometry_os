; DESCRIPTION: Draws a cyan rectangle at (448, 111) with width 36 and height 90.
; PLAN: r0=448(x), r1=111(y), r2=36(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 111
LDI r2, 36
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
