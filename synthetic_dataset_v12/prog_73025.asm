; DESCRIPTION: Places a black 58x102 rectangle at position (48, 30).
; PLAN: r0=48(x), r1=30(y), r2=58(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 30
LDI r2, 58
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
