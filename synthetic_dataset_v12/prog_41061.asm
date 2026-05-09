; DESCRIPTION: Places a red 110x89 rectangle at position (93, 154).
; PLAN: r0=93(x), r1=154(y), r2=110(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 154
LDI r2, 110
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
