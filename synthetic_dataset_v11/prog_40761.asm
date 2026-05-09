; DESCRIPTION: Places a purple 94x86 rectangle at position (26, 34).
; PLAN: r0=26(x), r1=34(y), r2=94(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 34
LDI r2, 94
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
