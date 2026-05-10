; DESCRIPTION: Creates a red filled rectangle of size 107x12 starting at (145, 195).
; PLAN: r0=145(x), r1=195(y), r2=107(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 195
LDI r2, 107
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
