; DESCRIPTION: Draws a cyan rectangle at (140, 50) with width 55 and height 50.
; PLAN: r0=140(x), r1=50(y), r2=55(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 50
LDI r2, 55
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
