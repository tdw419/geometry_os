; DESCRIPTION: Places a green 52x54 rectangle at position (184, 49).
; PLAN: r0=184(x), r1=49(y), r2=52(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 49
LDI r2, 52
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
