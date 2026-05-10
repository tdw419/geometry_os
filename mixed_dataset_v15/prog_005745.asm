; DESCRIPTION: Creates a red filled rectangle of size 39x99 starting at (380, 35).
; PLAN: r0=380(x), r1=35(y), r2=39(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 35
LDI r2, 39
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
