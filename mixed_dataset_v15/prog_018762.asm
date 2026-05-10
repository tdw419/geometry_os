; DESCRIPTION: Creates a green filled rectangle of size 96x62 starting at (299, 180).
; PLAN: r0=299(x), r1=180(y), r2=96(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 180
LDI r2, 96
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
