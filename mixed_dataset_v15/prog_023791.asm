; DESCRIPTION: Places a red 89x50 rectangle at position (256, 179).
; PLAN: r0=256(x), r1=179(y), r2=89(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 179
LDI r2, 89
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
