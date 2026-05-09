; DESCRIPTION: Draws a cyan rectangle at (20, 168) with width 60 and height 43.
; PLAN: r0=20(x), r1=168(y), r2=60(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 168
LDI r2, 60
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
