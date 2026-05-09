; DESCRIPTION: Draws a cyan rectangle at (196, 95) with width 63 and height 71.
; PLAN: r0=196(x), r1=95(y), r2=63(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 95
LDI r2, 63
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
