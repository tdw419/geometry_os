; DESCRIPTION: Places a magenta 31x97 rectangle at position (401, 51).
; PLAN: r0=401(x), r1=51(y), r2=31(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 51
LDI r2, 31
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
