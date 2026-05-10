; DESCRIPTION: Creates a magenta filled rectangle of size 37x115 starting at (215, 118).
; PLAN: r0=215(x), r1=118(y), r2=37(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 118
LDI r2, 37
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
