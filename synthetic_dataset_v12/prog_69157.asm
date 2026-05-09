; DESCRIPTION: Places a black 67x110 rectangle at position (335, 143).
; PLAN: r0=335(x), r1=143(y), r2=67(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 143
LDI r2, 67
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
