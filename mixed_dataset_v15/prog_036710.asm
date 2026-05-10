; DESCRIPTION: Creates a magenta filled rectangle of size 28x107 starting at (260, 131).
; PLAN: r0=260(x), r1=131(y), r2=28(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 131
LDI r2, 28
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
