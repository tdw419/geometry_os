; DESCRIPTION: Creates a red filled rectangle of size 80x115 starting at (277, 102).
; PLAN: r0=277(x), r1=102(y), r2=80(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 102
LDI r2, 80
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
