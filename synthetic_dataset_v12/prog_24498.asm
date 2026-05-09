; DESCRIPTION: Places a red 102x99 rectangle at position (323, 120).
; PLAN: r0=323(x), r1=120(y), r2=102(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 120
LDI r2, 102
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
