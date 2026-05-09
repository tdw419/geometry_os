; DESCRIPTION: Places a green 49x58 rectangle at position (347, 180).
; PLAN: r0=347(x), r1=180(y), r2=49(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 180
LDI r2, 49
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
