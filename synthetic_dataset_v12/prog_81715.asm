; DESCRIPTION: Places a green 32x20 rectangle at position (193, 32).
; PLAN: r0=193(x), r1=32(y), r2=32(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 32
LDI r2, 32
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
