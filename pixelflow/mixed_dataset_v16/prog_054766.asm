; DESCRIPTION: Places a magenta 106x98 rectangle at position (138, 94).
; PLAN: r0=138(x), r1=94(y), r2=106(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 94
LDI r2, 106
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
