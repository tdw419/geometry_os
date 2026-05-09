; DESCRIPTION: Places a yellow 116x94 rectangle at position (4, 132).
; PLAN: r0=4(x), r1=132(y), r2=116(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 132
LDI r2, 116
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
