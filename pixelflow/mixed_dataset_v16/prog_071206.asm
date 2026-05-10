; DESCRIPTION: Places a purple 102x58 rectangle at position (206, 120).
; PLAN: r0=206(x), r1=120(y), r2=102(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 120
LDI r2, 102
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
