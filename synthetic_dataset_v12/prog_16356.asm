; DESCRIPTION: Places a magenta 30x36 rectangle at position (317, 33).
; PLAN: r0=317(x), r1=33(y), r2=30(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 33
LDI r2, 30
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
