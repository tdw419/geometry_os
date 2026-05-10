; DESCRIPTION: Creates a purple filled rectangle of size 20x59 starting at (225, 159).
; PLAN: r0=225(x), r1=159(y), r2=20(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 159
LDI r2, 20
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
