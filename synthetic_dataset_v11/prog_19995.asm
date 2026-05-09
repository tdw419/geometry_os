; DESCRIPTION: Places a magenta 84x55 rectangle at position (168, 120).
; PLAN: r0=168(x), r1=120(y), r2=84(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 120
LDI r2, 84
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
