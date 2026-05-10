; DESCRIPTION: Creates a magenta filled rectangle of size 98x117 starting at (174, 181).
; PLAN: r0=174(x), r1=181(y), r2=98(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 181
LDI r2, 98
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
