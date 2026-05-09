; DESCRIPTION: Places a magenta 33x107 rectangle at position (133, 76).
; PLAN: r0=133(x), r1=76(y), r2=33(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 76
LDI r2, 33
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
