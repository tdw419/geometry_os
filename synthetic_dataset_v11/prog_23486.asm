; DESCRIPTION: Places a green 100x18 rectangle at position (20, 85).
; PLAN: r0=20(x), r1=85(y), r2=100(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 85
LDI r2, 100
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
