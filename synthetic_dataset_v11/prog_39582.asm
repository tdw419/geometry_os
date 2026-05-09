; DESCRIPTION: Places a magenta 56x111 rectangle at position (142, 36).
; PLAN: r0=142(x), r1=36(y), r2=56(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 36
LDI r2, 56
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
