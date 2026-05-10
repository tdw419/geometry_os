; DESCRIPTION: Creates a red filled rectangle of size 99x76 starting at (392, 34).
; PLAN: r0=392(x), r1=34(y), r2=99(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 34
LDI r2, 99
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
