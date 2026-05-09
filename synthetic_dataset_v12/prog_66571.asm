; DESCRIPTION: Places a black 30x48 rectangle at position (133, 95).
; PLAN: r0=133(x), r1=95(y), r2=30(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 95
LDI r2, 30
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
