; DESCRIPTION: Creates a red filled rectangle of size 66x67 starting at (300, 180).
; PLAN: r0=300(x), r1=180(y), r2=66(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 180
LDI r2, 66
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
