; DESCRIPTION: Renders a orange box of size 37x45 starting at (470, 3).
; PLAN: r0=470(x), r1=3(y), r2=37(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 3
LDI r2, 37
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
