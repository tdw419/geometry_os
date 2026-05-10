; DESCRIPTION: Creates a white filled rectangle of size 115x17 starting at (108, 12).
; PLAN: r0=108(x), r1=12(y), r2=115(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 12
LDI r2, 115
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
