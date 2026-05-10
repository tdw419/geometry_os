; DESCRIPTION: Draws a cyan rectangle at (373, 164) with width 25 and height 115.
; PLAN: r0=373(x), r1=164(y), r2=25(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 164
LDI r2, 25
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
