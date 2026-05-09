; DESCRIPTION: Renders a orange box of size 94x98 starting at (351, 94).
; PLAN: r0=351(x), r1=94(y), r2=94(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 94
LDI r2, 94
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
