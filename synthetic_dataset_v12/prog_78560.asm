; DESCRIPTION: Renders a magenta box of size 110x55 starting at (201, 173).
; PLAN: r0=201(x), r1=173(y), r2=110(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 173
LDI r2, 110
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
