; DESCRIPTION: Draws a cyan rectangle at (8, 108) with width 23 and height 82.
; PLAN: r0=8(x), r1=108(y), r2=23(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 108
LDI r2, 23
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
