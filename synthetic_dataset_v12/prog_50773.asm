; DESCRIPTION: Places a magenta 96x99 rectangle at position (14, 48).
; PLAN: r0=14(x), r1=48(y), r2=96(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 48
LDI r2, 96
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
