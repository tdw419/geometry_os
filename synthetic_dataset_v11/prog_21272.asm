; DESCRIPTION: Places a black 68x32 rectangle at position (179, 167).
; PLAN: r0=179(x), r1=167(y), r2=68(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 167
LDI r2, 68
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
