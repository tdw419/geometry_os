; DESCRIPTION: Places a magenta 89x43 rectangle at position (180, 133).
; PLAN: r0=180(x), r1=133(y), r2=89(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 133
LDI r2, 89
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
