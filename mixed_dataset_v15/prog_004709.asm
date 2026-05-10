; DESCRIPTION: Creates a white filled rectangle of size 49x82 starting at (277, 8).
; PLAN: r0=277(x), r1=8(y), r2=49(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 8
LDI r2, 49
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
