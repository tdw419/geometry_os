; DESCRIPTION: Places a red 87x99 rectangle at position (196, 105).
; PLAN: r0=196(x), r1=105(y), r2=87(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 105
LDI r2, 87
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
