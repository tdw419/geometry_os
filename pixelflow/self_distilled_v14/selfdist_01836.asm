; DESCRIPTION: Creates a green filled rectangle of size 48x95 starting at (333, 123).
; PLAN: r0=333(x), r1=123(y), r2=48(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 123
LDI r2, 48
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
