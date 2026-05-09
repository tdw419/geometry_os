; DESCRIPTION: Places a red 110x100 rectangle at position (43, 16).
; PLAN: r0=43(x), r1=16(y), r2=110(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 16
LDI r2, 110
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
