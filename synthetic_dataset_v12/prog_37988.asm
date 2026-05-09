; DESCRIPTION: Places a red 72x93 rectangle at position (413, 110).
; PLAN: r0=413(x), r1=110(y), r2=72(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 110
LDI r2, 72
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
