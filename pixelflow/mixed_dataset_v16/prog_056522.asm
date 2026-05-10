; DESCRIPTION: Places a green 116x52 box at position (100, 37).
; PLAN: r0=100(x), r1=37(y), r2=116(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 37
LDI r2, 116
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
