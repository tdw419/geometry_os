; DESCRIPTION: Places a red 15x110 rectangle at position (196, 100).
; PLAN: r0=196(x), r1=100(y), r2=15(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 100
LDI r2, 15
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
