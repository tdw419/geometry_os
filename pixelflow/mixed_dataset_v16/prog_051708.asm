; DESCRIPTION: Places a red 32x20 box at position (100, 78).
; PLAN: r0=100(x), r1=78(y), r2=32(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 78
LDI r2, 32
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
