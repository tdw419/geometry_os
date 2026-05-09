; DESCRIPTION: Places a black 61x60 rectangle at position (168, 137).
; PLAN: r0=168(x), r1=137(y), r2=61(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 137
LDI r2, 61
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
