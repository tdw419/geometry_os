; DESCRIPTION: Places a black 15x59 rectangle at position (109, 150).
; PLAN: r0=109(x), r1=150(y), r2=15(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 150
LDI r2, 15
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
