; DESCRIPTION: Creates a red filled rectangle of size 43x117 starting at (249, 160).
; PLAN: r0=249(x), r1=160(y), r2=43(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 160
LDI r2, 43
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
