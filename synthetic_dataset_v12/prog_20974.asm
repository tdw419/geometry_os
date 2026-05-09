; DESCRIPTION: Places a green 39x49 rectangle at position (296, 105).
; PLAN: r0=296(x), r1=105(y), r2=39(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 105
LDI r2, 39
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
