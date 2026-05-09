; DESCRIPTION: Places a blue 61x48 rectangle at position (283, 179).
; PLAN: r0=283(x), r1=179(y), r2=61(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 179
LDI r2, 61
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
