; DESCRIPTION: Creates a purple filled rectangle of size 113x12 starting at (168, 153).
; PLAN: r0=168(x), r1=153(y), r2=113(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 153
LDI r2, 113
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
