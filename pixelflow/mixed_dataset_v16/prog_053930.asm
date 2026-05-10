; DESCRIPTION: Creates a white filled rectangle of size 99x93 starting at (50, 140).
; PLAN: r0=50(x), r1=140(y), r2=99(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 140
LDI r2, 99
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
