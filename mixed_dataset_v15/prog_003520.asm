; DESCRIPTION: Places a black 16x25 rectangle at position (308, 13).
; PLAN: r0=308(x), r1=13(y), r2=16(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 13
LDI r2, 16
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
