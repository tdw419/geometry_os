; DESCRIPTION: Places a black 68x110 rectangle at position (317, 6).
; PLAN: r0=317(x), r1=6(y), r2=68(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 6
LDI r2, 68
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
