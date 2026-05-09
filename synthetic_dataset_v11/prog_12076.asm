; DESCRIPTION: Places a black 80x25 rectangle at position (14, 206).
; PLAN: r0=14(x), r1=206(y), r2=80(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 206
LDI r2, 80
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
