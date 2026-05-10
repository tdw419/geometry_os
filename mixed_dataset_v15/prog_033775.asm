; DESCRIPTION: Places a magenta 72x34 rectangle at position (160, 218).
; PLAN: r0=160(x), r1=218(y), r2=72(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 218
LDI r2, 72
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
