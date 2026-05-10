; DESCRIPTION: Creates a green filled rectangle of size 33x11 starting at (224, 70).
; PLAN: r0=224(x), r1=70(y), r2=33(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 70
LDI r2, 33
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
