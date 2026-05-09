; DESCRIPTION: Places a green 14x35 rectangle at position (296, 140).
; PLAN: r0=296(x), r1=140(y), r2=14(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 140
LDI r2, 14
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
