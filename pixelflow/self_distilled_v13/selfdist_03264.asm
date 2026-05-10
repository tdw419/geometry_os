; DESCRIPTION: Creates a white filled rectangle of size 22x29 starting at (168, 172).
; PLAN: r0=168(x), r1=172(y), r2=22(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 172
LDI r2, 22
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
