; DESCRIPTION: Creates a red filled rectangle of size 44x70 starting at (224, 100).
; PLAN: r0=224(x), r1=100(y), r2=44(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 100
LDI r2, 44
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
