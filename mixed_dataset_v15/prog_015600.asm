; DESCRIPTION: Renders a orange box of size 83x10 starting at (405, 192).
; PLAN: r0=405(x), r1=192(y), r2=83(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 192
LDI r2, 83
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
