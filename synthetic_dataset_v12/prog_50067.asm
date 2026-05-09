; DESCRIPTION: Draws a cyan rectangle at (327, 82) with width 68 and height 37.
; PLAN: r0=327(x), r1=82(y), r2=68(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 82
LDI r2, 68
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
