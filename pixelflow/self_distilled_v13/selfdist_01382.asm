; DESCRIPTION: Creates a yellow filled rectangle of size 32x116 starting at (106, 197).
; PLAN: r0=106(x), r1=197(y), r2=32(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 197
LDI r2, 32
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
