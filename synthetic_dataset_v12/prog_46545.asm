; DESCRIPTION: Places a magenta 76x68 rectangle at position (106, 51).
; PLAN: r0=106(x), r1=51(y), r2=76(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 51
LDI r2, 76
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
