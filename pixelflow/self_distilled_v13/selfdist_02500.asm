; DESCRIPTION: Creates a orange filled rectangle of size 94x47 starting at (366, 6).
; PLAN: r0=366(x), r1=6(y), r2=94(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 6
LDI r2, 94
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
