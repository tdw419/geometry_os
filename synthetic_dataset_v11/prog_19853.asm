; DESCRIPTION: Places a black 79x35 rectangle at position (172, 2).
; PLAN: r0=172(x), r1=2(y), r2=79(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 2
LDI r2, 79
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
