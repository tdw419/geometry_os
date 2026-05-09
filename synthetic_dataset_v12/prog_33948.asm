; DESCRIPTION: Draws a cyan rectangle at (9, 111) with width 50 and height 73.
; PLAN: r0=9(x), r1=111(y), r2=50(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 111
LDI r2, 50
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
