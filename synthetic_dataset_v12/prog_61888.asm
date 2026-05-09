; DESCRIPTION: Places a purple 45x43 rectangle at position (305, 150).
; PLAN: r0=305(x), r1=150(y), r2=45(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 150
LDI r2, 45
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
