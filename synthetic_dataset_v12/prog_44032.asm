; DESCRIPTION: Places a blue 111x10 rectangle at position (343, 79).
; PLAN: r0=343(x), r1=79(y), r2=111(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 79
LDI r2, 111
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
