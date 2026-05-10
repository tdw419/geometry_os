; DESCRIPTION: Places a blue 58x61 box at position (335, 21).
; PLAN: r0=335(x), r1=21(y), r2=58(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 21
LDI r2, 58
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
