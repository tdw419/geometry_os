; DESCRIPTION: Places a black 61x54 rectangle at position (45, 172).
; PLAN: r0=45(x), r1=172(y), r2=61(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 172
LDI r2, 61
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
