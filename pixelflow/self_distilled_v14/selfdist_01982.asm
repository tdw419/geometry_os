; DESCRIPTION: Creates a magenta filled rectangle of size 112x115 starting at (213, 166).
; PLAN: r0=213(x), r1=166(y), r2=112(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 166
LDI r2, 112
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
