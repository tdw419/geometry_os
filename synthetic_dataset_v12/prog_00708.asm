; DESCRIPTION: Places a orange 60x111 rectangle at position (58, 79).
; PLAN: r0=58(x), r1=79(y), r2=60(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 79
LDI r2, 60
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
