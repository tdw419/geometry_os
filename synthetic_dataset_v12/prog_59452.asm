; DESCRIPTION: Places a magenta 79x85 rectangle at position (185, 96).
; PLAN: r0=185(x), r1=96(y), r2=79(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 96
LDI r2, 79
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
