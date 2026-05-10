; DESCRIPTION: Creates a green filled rectangle of size 61x120 starting at (269, 156).
; PLAN: r0=269(x), r1=156(y), r2=61(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 156
LDI r2, 61
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
