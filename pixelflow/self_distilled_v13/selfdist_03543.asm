; DESCRIPTION: Places a green 62x103 box at position (137, 180).
; PLAN: r0=137(x), r1=180(y), r2=62(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 180
LDI r2, 62
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
