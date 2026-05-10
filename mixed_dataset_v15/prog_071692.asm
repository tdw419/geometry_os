; DESCRIPTION: Places a black 75x30 rectangle at position (170, 148).
; PLAN: r0=170(x), r1=148(y), r2=75(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 148
LDI r2, 75
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
