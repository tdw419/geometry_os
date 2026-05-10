; DESCRIPTION: Creates a green filled rectangle of size 111x112 starting at (181, 14).
; PLAN: r0=181(x), r1=14(y), r2=111(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 14
LDI r2, 111
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
