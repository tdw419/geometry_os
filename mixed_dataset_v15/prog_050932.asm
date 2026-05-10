; DESCRIPTION: Creates a white filled rectangle of size 12x82 starting at (247, 20).
; PLAN: r0=247(x), r1=20(y), r2=12(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 20
LDI r2, 12
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
