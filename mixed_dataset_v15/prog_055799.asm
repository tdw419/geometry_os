; DESCRIPTION: Creates a yellow filled rectangle of size 72x11 starting at (338, 162).
; PLAN: r0=338(x), r1=162(y), r2=72(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 162
LDI r2, 72
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
