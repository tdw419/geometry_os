; DESCRIPTION: Creates a white filled rectangle of size 72x52 starting at (329, 55).
; PLAN: r0=329(x), r1=55(y), r2=72(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 55
LDI r2, 72
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
