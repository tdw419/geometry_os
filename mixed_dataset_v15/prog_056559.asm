; DESCRIPTION: Creates a white filled rectangle of size 112x92 starting at (317, 76).
; PLAN: r0=317(x), r1=76(y), r2=112(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 76
LDI r2, 112
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
