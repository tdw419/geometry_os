; DESCRIPTION: Creates a yellow filled rectangle of size 106x113 starting at (318, 149).
; PLAN: r0=318(x), r1=149(y), r2=106(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 149
LDI r2, 106
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
