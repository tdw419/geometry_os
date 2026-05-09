; DESCRIPTION: Places a red 30x87 rectangle at position (222, 20).
; PLAN: r0=222(x), r1=20(y), r2=30(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 20
LDI r2, 30
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
