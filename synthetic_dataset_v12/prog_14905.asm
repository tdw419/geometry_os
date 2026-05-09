; DESCRIPTION: Draws a cyan rectangle at (185, 42) with width 117 and height 76.
; PLAN: r0=185(x), r1=42(y), r2=117(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 42
LDI r2, 117
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
