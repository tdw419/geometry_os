; DESCRIPTION: Places a black 14x45 rectangle at position (158, 55).
; PLAN: r0=158(x), r1=55(y), r2=14(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 55
LDI r2, 14
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
