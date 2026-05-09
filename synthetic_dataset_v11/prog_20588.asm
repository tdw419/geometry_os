; DESCRIPTION: Places a red 85x52 rectangle at position (16, 80).
; PLAN: r0=16(x), r1=80(y), r2=85(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 80
LDI r2, 85
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
