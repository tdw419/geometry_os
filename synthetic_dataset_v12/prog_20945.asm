; DESCRIPTION: Places a black 61x10 rectangle at position (323, 1).
; PLAN: r0=323(x), r1=1(y), r2=61(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 1
LDI r2, 61
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
