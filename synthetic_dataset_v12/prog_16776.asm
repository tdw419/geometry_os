; DESCRIPTION: Places a magenta 33x52 rectangle at position (322, 70).
; PLAN: r0=322(x), r1=70(y), r2=33(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 70
LDI r2, 33
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
