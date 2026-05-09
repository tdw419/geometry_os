; DESCRIPTION: Places a green 20x15 rectangle at position (80, 49).
; PLAN: r0=80(x), r1=49(y), r2=20(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 49
LDI r2, 20
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
