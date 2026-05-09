; DESCRIPTION: Renders a orange box of size 21x22 starting at (185, 89).
; PLAN: r0=185(x), r1=89(y), r2=21(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 89
LDI r2, 21
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
