; DESCRIPTION: Places a magenta 60x52 rectangle at position (34, 51).
; PLAN: r0=34(x), r1=51(y), r2=60(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 51
LDI r2, 60
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
