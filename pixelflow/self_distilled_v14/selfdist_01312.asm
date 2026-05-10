; DESCRIPTION: Creates a white filled rectangle of size 111x10 starting at (134, 133).
; PLAN: r0=134(x), r1=133(y), r2=111(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 133
LDI r2, 111
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
