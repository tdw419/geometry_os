; DESCRIPTION: Draws a cyan rectangle at (285, 71) with width 60 and height 85.
; PLAN: r0=285(x), r1=71(y), r2=60(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 71
LDI r2, 60
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
