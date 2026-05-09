; DESCRIPTION: Creates a orange rectangular region at (398, 12) spanning 36 by 31 pixels.
; PLAN: r0=398(x), r1=12(y), r2=36(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 12
LDI r2, 36
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
