; DESCRIPTION: Places a magenta 109x25 rectangle at position (328, 85).
; PLAN: r0=328(x), r1=85(y), r2=109(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 85
LDI r2, 109
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
