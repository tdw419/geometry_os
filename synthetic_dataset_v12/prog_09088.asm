; DESCRIPTION: Places a magenta 73x52 rectangle at position (325, 55).
; PLAN: r0=325(x), r1=55(y), r2=73(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 55
LDI r2, 73
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
