; DESCRIPTION: Places a magenta 79x73 rectangle at position (276, 123).
; PLAN: r0=276(x), r1=123(y), r2=79(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 123
LDI r2, 79
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
