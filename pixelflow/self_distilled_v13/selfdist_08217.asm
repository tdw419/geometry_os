; DESCRIPTION: Creates a orange filled rectangle of size 120x88 starting at (48, 109).
; PLAN: r0=48(x), r1=109(y), r2=120(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 109
LDI r2, 120
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
