; DESCRIPTION: Creates a purple filled rectangle of size 42x34 starting at (369, 70).
; PLAN: r0=369(x), r1=70(y), r2=42(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 70
LDI r2, 42
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
