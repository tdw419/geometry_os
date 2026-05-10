; DESCRIPTION: Creates a red filled rectangle of size 109x33 starting at (70, 120).
; PLAN: r0=70(x), r1=120(y), r2=109(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 120
LDI r2, 109
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
