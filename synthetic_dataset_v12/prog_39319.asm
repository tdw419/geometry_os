; DESCRIPTION: Places a green 31x12 rectangle at position (419, 71).
; PLAN: r0=419(x), r1=71(y), r2=31(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 71
LDI r2, 31
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
