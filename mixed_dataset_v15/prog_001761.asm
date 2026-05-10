; DESCRIPTION: Creates a magenta filled rectangle of size 33x27 starting at (230, 195).
; PLAN: r0=230(x), r1=195(y), r2=33(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 195
LDI r2, 33
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
