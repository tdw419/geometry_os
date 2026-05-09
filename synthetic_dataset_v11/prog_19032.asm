; DESCRIPTION: Places a blue 38x80 rectangle at position (193, 12).
; PLAN: r0=193(x), r1=12(y), r2=38(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 12
LDI r2, 38
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
