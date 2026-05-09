; DESCRIPTION: Places a red 32x34 rectangle at position (250, 80).
; PLAN: r0=250(x), r1=80(y), r2=32(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 80
LDI r2, 32
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
