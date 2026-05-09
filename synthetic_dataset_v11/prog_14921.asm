; DESCRIPTION: Draws a cyan rectangle at (19, 111) with width 79 and height 115.
; PLAN: r0=19(x), r1=111(y), r2=79(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 111
LDI r2, 79
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
