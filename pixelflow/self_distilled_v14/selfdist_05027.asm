; DESCRIPTION: Creates a orange filled rectangle of size 39x33 starting at (48, 30).
; PLAN: r0=48(x), r1=30(y), r2=39(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 30
LDI r2, 39
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
