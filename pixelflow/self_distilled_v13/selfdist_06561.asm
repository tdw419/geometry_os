; DESCRIPTION: Creates a magenta filled rectangle of size 48x70 starting at (121, 107).
; PLAN: r0=121(x), r1=107(y), r2=48(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 107
LDI r2, 48
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
