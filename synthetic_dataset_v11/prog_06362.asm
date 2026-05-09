; DESCRIPTION: Renders a orange box of size 89x110 starting at (77, 91).
; PLAN: r0=77(x), r1=91(y), r2=89(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 91
LDI r2, 89
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
