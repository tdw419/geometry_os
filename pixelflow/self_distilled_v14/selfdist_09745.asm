; DESCRIPTION: Creates a green filled rectangle of size 50x93 starting at (186, 61).
; PLAN: r0=186(x), r1=61(y), r2=50(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 61
LDI r2, 50
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
