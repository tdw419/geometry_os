; DESCRIPTION: Places a black 71x85 rectangle at position (70, 137).
; PLAN: r0=70(x), r1=137(y), r2=71(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 137
LDI r2, 71
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
