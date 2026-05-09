; DESCRIPTION: Places a black 59x68 rectangle at position (179, 150).
; PLAN: r0=179(x), r1=150(y), r2=59(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 150
LDI r2, 59
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
