; DESCRIPTION: Creates a yellow filled rectangle of size 76x117 starting at (394, 150).
; PLAN: r0=394(x), r1=150(y), r2=76(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 150
LDI r2, 76
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
