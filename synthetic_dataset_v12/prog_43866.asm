; DESCRIPTION: Places a magenta 80x30 rectangle at position (199, 48).
; PLAN: r0=199(x), r1=48(y), r2=80(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 48
LDI r2, 80
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
