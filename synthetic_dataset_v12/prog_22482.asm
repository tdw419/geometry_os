; DESCRIPTION: Places a black 96x103 rectangle at position (363, 148).
; PLAN: r0=363(x), r1=148(y), r2=96(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 148
LDI r2, 96
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
