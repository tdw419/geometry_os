; DESCRIPTION: Places a purple 78x63 rectangle at position (150, 108).
; PLAN: r0=150(x), r1=108(y), r2=78(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 108
LDI r2, 78
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
