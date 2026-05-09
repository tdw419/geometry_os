; DESCRIPTION: Places a red 12x10 rectangle at position (77, 80).
; PLAN: r0=77(x), r1=80(y), r2=12(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 80
LDI r2, 12
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
