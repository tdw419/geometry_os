; DESCRIPTION: Places a black 40x94 rectangle at position (269, 84).
; PLAN: r0=269(x), r1=84(y), r2=40(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 84
LDI r2, 40
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
