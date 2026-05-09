; DESCRIPTION: Places a green 94x92 rectangle at position (126, 43).
; PLAN: r0=126(x), r1=43(y), r2=94(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 43
LDI r2, 94
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
