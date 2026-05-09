; DESCRIPTION: Places a blue 68x52 rectangle at position (317, 82).
; PLAN: r0=317(x), r1=82(y), r2=68(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 82
LDI r2, 68
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
