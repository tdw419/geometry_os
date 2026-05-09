; DESCRIPTION: Places a black 42x117 rectangle at position (149, 48).
; PLAN: r0=149(x), r1=48(y), r2=42(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 48
LDI r2, 42
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
