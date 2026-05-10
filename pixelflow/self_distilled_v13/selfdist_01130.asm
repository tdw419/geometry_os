; DESCRIPTION: Creates a purple filled rectangle of size 71x75 starting at (197, 135).
; PLAN: r0=197(x), r1=135(y), r2=71(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 135
LDI r2, 71
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
