; DESCRIPTION: Places a black 57x63 rectangle at position (108, 25).
; PLAN: r0=108(x), r1=25(y), r2=57(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 25
LDI r2, 57
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
