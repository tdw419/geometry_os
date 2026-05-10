; DESCRIPTION: Creates a green filled rectangle of size 111x107 starting at (360, 73).
; PLAN: r0=360(x), r1=73(y), r2=111(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 73
LDI r2, 111
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
