; DESCRIPTION: Creates a yellow filled rectangle of size 91x65 starting at (237, 47).
; PLAN: r0=237(x), r1=47(y), r2=91(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 47
LDI r2, 91
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
