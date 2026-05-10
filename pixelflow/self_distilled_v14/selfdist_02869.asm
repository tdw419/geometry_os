; DESCRIPTION: Creates a white filled rectangle of size 13x17 starting at (240, 36).
; PLAN: r0=240(x), r1=36(y), r2=13(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 36
LDI r2, 13
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
