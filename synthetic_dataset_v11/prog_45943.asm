; DESCRIPTION: Places a green 85x115 rectangle at position (35, 56).
; PLAN: r0=35(x), r1=56(y), r2=85(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 56
LDI r2, 85
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
