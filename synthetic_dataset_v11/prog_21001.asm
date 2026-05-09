; DESCRIPTION: Draws a black rectangle at (139, 231) with width 82 and height 21.
; PLAN: r0=139(x), r1=231(y), r2=82(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 231
LDI r2, 82
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
