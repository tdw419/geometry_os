; DESCRIPTION: Creates a white filled rectangle of size 94x120 starting at (384, 53).
; PLAN: r0=384(x), r1=53(y), r2=94(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 53
LDI r2, 94
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
