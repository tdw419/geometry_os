; DESCRIPTION: Places a magenta 80x47 rectangle at position (100, 48).
; PLAN: r0=100(x), r1=48(y), r2=80(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 48
LDI r2, 80
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
