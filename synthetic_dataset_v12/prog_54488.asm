; DESCRIPTION: Places a blue 61x97 rectangle at position (99, 126).
; PLAN: r0=99(x), r1=126(y), r2=61(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 126
LDI r2, 61
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
