; DESCRIPTION: Creates a red filled rectangle of size 24x75 starting at (73, 28).
; PLAN: r0=73(x), r1=28(y), r2=24(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 28
LDI r2, 24
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
