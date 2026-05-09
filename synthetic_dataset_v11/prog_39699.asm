; DESCRIPTION: Places a magenta 106x81 rectangle at position (11, 55).
; PLAN: r0=11(x), r1=55(y), r2=106(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 55
LDI r2, 106
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
