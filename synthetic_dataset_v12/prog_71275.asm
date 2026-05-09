; DESCRIPTION: Places a orange 66x115 rectangle at position (58, 30).
; PLAN: r0=58(x), r1=30(y), r2=66(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 30
LDI r2, 66
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
