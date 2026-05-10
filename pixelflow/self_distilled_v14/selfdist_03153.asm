; DESCRIPTION: Creates a white filled rectangle of size 54x66 starting at (67, 177).
; PLAN: r0=67(x), r1=177(y), r2=54(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 177
LDI r2, 54
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
