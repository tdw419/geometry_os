; DESCRIPTION: Renders a orange box of size 99x31 starting at (57, 192).
; PLAN: r0=57(x), r1=192(y), r2=99(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 192
LDI r2, 99
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
