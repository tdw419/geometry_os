; DESCRIPTION: Draws a cyan rectangle at (311, 42) with width 45 and height 108.
; PLAN: r0=311(x), r1=42(y), r2=45(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 42
LDI r2, 45
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
