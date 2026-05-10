; DESCRIPTION: Places a black 86x102 rectangle at position (169, 94).
; PLAN: r0=169(x), r1=94(y), r2=86(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 94
LDI r2, 86
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
