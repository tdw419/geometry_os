; DESCRIPTION: Places a red 20x102 rectangle at position (116, 120).
; PLAN: r0=116(x), r1=120(y), r2=20(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 120
LDI r2, 20
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
