; DESCRIPTION: Creates a red filled rectangle of size 50x89 starting at (320, 69).
; PLAN: r0=320(x), r1=69(y), r2=50(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 69
LDI r2, 50
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
