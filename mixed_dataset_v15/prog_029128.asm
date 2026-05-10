; DESCRIPTION: Creates a white filled rectangle of size 48x13 starting at (370, 178).
; PLAN: r0=370(x), r1=178(y), r2=48(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 178
LDI r2, 48
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
