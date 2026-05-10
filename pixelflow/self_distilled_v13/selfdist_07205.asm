; DESCRIPTION: Creates a red filled rectangle of size 43x111 starting at (221, 119).
; PLAN: r0=221(x), r1=119(y), r2=43(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 119
LDI r2, 43
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
