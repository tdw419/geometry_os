; DESCRIPTION: Places a red 72x110 rectangle at position (35, 80).
; PLAN: r0=35(x), r1=80(y), r2=72(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 80
LDI r2, 72
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
