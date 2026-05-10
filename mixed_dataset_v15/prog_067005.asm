; DESCRIPTION: Places a magenta 50x47 rectangle at position (115, 112).
; PLAN: r0=115(x), r1=112(y), r2=50(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 112
LDI r2, 50
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
