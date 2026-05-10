; DESCRIPTION: Places a purple 61x106 rectangle at position (401, 141).
; PLAN: r0=401(x), r1=141(y), r2=61(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 141
LDI r2, 61
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
