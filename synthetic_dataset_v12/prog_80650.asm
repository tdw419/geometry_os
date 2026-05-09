; DESCRIPTION: Places a green 11x90 rectangle at position (85, 131).
; PLAN: r0=85(x), r1=131(y), r2=11(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 131
LDI r2, 11
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
