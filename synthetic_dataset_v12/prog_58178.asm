; DESCRIPTION: Places a red 36x18 rectangle at position (463, 110).
; PLAN: r0=463(x), r1=110(y), r2=36(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 110
LDI r2, 36
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
