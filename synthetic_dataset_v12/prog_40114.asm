; DESCRIPTION: Places a red 10x20 rectangle at position (156, 81).
; PLAN: r0=156(x), r1=81(y), r2=10(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 81
LDI r2, 10
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
