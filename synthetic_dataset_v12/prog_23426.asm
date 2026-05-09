; DESCRIPTION: Draws a cyan rectangle at (73, 37) with width 85 and height 27.
; PLAN: r0=73(x), r1=37(y), r2=85(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 37
LDI r2, 85
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
