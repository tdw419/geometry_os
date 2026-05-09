; DESCRIPTION: Draws a cyan rectangle at (175, 150) with width 53 and height 63.
; PLAN: r0=175(x), r1=150(y), r2=53(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 150
LDI r2, 53
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
