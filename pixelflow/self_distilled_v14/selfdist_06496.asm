; DESCRIPTION: Creates a yellow filled rectangle of size 23x90 starting at (241, 144).
; PLAN: r0=241(x), r1=144(y), r2=23(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 144
LDI r2, 23
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
