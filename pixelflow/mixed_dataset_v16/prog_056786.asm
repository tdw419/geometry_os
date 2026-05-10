; DESCRIPTION: Places a red 98x100 rectangle at position (131, 85).
; PLAN: r0=131(x), r1=85(y), r2=98(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 85
LDI r2, 98
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
