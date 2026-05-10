; DESCRIPTION: Places a green 49x47 rectangle at position (87, 10).
; PLAN: r0=87(x), r1=10(y), r2=49(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 10
LDI r2, 49
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
