; DESCRIPTION: Places a orange 71x115 rectangle at position (142, 3).
; PLAN: r0=142(x), r1=3(y), r2=71(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 3
LDI r2, 71
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
