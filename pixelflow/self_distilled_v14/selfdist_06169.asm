; DESCRIPTION: Creates a orange filled rectangle of size 50x107 starting at (398, 124).
; PLAN: r0=398(x), r1=124(y), r2=50(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 124
LDI r2, 50
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
