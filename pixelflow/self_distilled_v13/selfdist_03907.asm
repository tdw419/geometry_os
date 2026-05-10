; DESCRIPTION: Creates a orange filled rectangle of size 101x86 starting at (21, 148).
; PLAN: r0=21(x), r1=148(y), r2=101(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 148
LDI r2, 101
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
