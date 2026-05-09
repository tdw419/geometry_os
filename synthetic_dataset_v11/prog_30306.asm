; DESCRIPTION: Places a magenta 44x57 rectangle at position (33, 70).
; PLAN: r0=33(x), r1=70(y), r2=44(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 70
LDI r2, 44
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
