; DESCRIPTION: Creates a orange filled rectangle of size 117x33 starting at (249, 4).
; PLAN: r0=249(x), r1=4(y), r2=117(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 4
LDI r2, 117
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
