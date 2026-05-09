; DESCRIPTION: Places a black 94x95 rectangle at position (54, 48).
; PLAN: r0=54(x), r1=48(y), r2=94(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 48
LDI r2, 94
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
