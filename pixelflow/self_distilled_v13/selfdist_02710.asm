; DESCRIPTION: Creates a green filled rectangle of size 120x80 starting at (329, 163).
; PLAN: r0=329(x), r1=163(y), r2=120(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 163
LDI r2, 120
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
