; DESCRIPTION: Creates a white filled rectangle of size 20x90 starting at (311, 135).
; PLAN: r0=311(x), r1=135(y), r2=20(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 135
LDI r2, 20
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
