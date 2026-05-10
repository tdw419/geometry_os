; DESCRIPTION: Creates a white filled rectangle of size 12x27 starting at (311, 173).
; PLAN: r0=311(x), r1=173(y), r2=12(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 173
LDI r2, 12
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
