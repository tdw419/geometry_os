; DESCRIPTION: Places a yellow 100x60 rectangle at position (315, 63).
; PLAN: r0=315(x), r1=63(y), r2=100(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 63
LDI r2, 100
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
