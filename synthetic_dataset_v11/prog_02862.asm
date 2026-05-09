; DESCRIPTION: Renders a magenta box of size 38x77 starting at (31, 179).
; PLAN: r0=31(x), r1=179(y), r2=38(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 179
LDI r2, 38
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
