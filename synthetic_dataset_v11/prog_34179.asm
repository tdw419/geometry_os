; DESCRIPTION: Places a black 95x86 rectangle at position (61, 136).
; PLAN: r0=61(x), r1=136(y), r2=95(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 136
LDI r2, 95
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
