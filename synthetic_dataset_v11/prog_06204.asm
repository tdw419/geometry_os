; DESCRIPTION: Places a black 63x63 rectangle at position (58, 59).
; PLAN: r0=58(x), r1=59(y), r2=63(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 59
LDI r2, 63
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
