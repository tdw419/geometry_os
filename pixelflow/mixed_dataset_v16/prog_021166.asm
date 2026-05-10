; DESCRIPTION: Places a blue 79x116 rectangle at position (345, 112).
; PLAN: r0=345(x), r1=112(y), r2=79(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 112
LDI r2, 79
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
