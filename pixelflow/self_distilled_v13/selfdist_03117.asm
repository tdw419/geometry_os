; DESCRIPTION: Creates a white filled rectangle of size 73x111 starting at (271, 89).
; PLAN: r0=271(x), r1=89(y), r2=73(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 89
LDI r2, 73
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
