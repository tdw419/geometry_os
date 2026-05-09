; DESCRIPTION: Places a magenta 47x32 rectangle at position (185, 133).
; PLAN: r0=185(x), r1=133(y), r2=47(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 133
LDI r2, 47
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
