; DESCRIPTION: Creates a magenta filled rectangle of size 103x53 starting at (241, 40).
; PLAN: r0=241(x), r1=40(y), r2=103(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 40
LDI r2, 103
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
