; DESCRIPTION: Places a magenta 50x11 rectangle at position (135, 48).
; PLAN: r0=135(x), r1=48(y), r2=50(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 48
LDI r2, 50
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
