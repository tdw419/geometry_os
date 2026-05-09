; DESCRIPTION: Places a purple 58x63 rectangle at position (208, 50).
; PLAN: r0=208(x), r1=50(y), r2=58(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 50
LDI r2, 58
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
