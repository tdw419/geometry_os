; DESCRIPTION: Renders a orange box of size 13x77 starting at (417, 26).
; PLAN: r0=417(x), r1=26(y), r2=13(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 26
LDI r2, 13
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
