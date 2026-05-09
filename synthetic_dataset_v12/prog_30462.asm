; DESCRIPTION: Places a blue 120x31 rectangle at position (221, 218).
; PLAN: r0=221(x), r1=218(y), r2=120(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 218
LDI r2, 120
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
