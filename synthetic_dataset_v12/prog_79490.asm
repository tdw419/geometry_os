; DESCRIPTION: Renders a orange box of size 44x47 starting at (94, 192).
; PLAN: r0=94(x), r1=192(y), r2=44(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 192
LDI r2, 44
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
