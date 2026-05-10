; DESCRIPTION: Creates a magenta filled rectangle of size 18x44 starting at (175, 112).
; PLAN: r0=175(x), r1=112(y), r2=18(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 112
LDI r2, 18
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
