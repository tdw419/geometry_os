; DESCRIPTION: Places a magenta 88x107 rectangle at position (92, 48).
; PLAN: r0=92(x), r1=48(y), r2=88(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 48
LDI r2, 88
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
