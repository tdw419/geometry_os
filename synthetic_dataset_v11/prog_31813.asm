; DESCRIPTION: Places a blue 40x77 rectangle at position (211, 61).
; PLAN: r0=211(x), r1=61(y), r2=40(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 61
LDI r2, 40
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
