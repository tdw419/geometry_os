; DESCRIPTION: Creates a orange filled rectangle of size 54x12 starting at (211, 177).
; PLAN: r0=211(x), r1=177(y), r2=54(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 177
LDI r2, 54
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
