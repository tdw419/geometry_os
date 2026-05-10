; DESCRIPTION: Creates a green filled rectangle of size 106x32 starting at (374, 155).
; PLAN: r0=374(x), r1=155(y), r2=106(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 155
LDI r2, 106
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
