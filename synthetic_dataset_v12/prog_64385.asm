; DESCRIPTION: Draws a cyan rectangle at (93, 79) with width 76 and height 45.
; PLAN: r0=93(x), r1=79(y), r2=76(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 79
LDI r2, 76
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
