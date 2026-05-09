; DESCRIPTION: Places a blue 106x48 rectangle at position (10, 15).
; PLAN: r0=10(x), r1=15(y), r2=106(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 15
LDI r2, 106
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
