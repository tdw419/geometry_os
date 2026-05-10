; DESCRIPTION: Places a blue 120x94 rectangle at position (193, 76).
; PLAN: r0=193(x), r1=76(y), r2=120(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 76
LDI r2, 120
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
