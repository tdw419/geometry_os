; DESCRIPTION: Places a magenta 38x23 rectangle at position (14, 112).
; PLAN: r0=14(x), r1=112(y), r2=38(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 112
LDI r2, 38
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
