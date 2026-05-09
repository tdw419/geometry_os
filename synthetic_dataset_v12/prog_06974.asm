; DESCRIPTION: Places a magenta 80x55 rectangle at position (199, 42).
; PLAN: r0=199(x), r1=42(y), r2=80(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 42
LDI r2, 80
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
