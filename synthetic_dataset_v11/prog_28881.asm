; DESCRIPTION: Places a purple 40x94 rectangle at position (46, 43).
; PLAN: r0=46(x), r1=43(y), r2=40(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 43
LDI r2, 40
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
