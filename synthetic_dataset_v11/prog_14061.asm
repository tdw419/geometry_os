; DESCRIPTION: Draws a cyan rectangle at (89, 31) with width 37 and height 82.
; PLAN: r0=89(x), r1=31(y), r2=37(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 31
LDI r2, 37
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
