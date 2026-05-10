; DESCRIPTION: Creates a green filled rectangle of size 98x115 starting at (379, 182).
; PLAN: r0=379(x), r1=182(y), r2=98(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 182
LDI r2, 98
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
