; DESCRIPTION: Draws a cyan rectangle at (231, 103) with width 70 and height 63.
; PLAN: r0=231(x), r1=103(y), r2=70(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 103
LDI r2, 70
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
