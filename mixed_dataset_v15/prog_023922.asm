; DESCRIPTION: Places a purple 68x57 rectangle at position (303, 26).
; PLAN: r0=303(x), r1=26(y), r2=68(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 26
LDI r2, 68
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
