; DESCRIPTION: Places a magenta 33x31 rectangle at position (104, 138).
; PLAN: r0=104(x), r1=138(y), r2=33(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 138
LDI r2, 33
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
