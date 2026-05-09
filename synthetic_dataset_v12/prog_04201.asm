; DESCRIPTION: Draws a cyan rectangle at (60, 9) with width 111 and height 31.
; PLAN: r0=60(x), r1=9(y), r2=111(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 9
LDI r2, 111
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
