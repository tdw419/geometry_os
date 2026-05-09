; DESCRIPTION: Places a magenta 88x109 rectangle at position (368, 31).
; PLAN: r0=368(x), r1=31(y), r2=88(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 31
LDI r2, 88
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
