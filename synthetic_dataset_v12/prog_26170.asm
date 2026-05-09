; DESCRIPTION: Places a black 119x55 rectangle at position (150, 132).
; PLAN: r0=150(x), r1=132(y), r2=119(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 132
LDI r2, 119
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
