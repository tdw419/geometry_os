; DESCRIPTION: Places a blue 100x65 rectangle at position (75, 120).
; PLAN: r0=75(x), r1=120(y), r2=100(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 120
LDI r2, 100
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
