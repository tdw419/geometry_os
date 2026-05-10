; DESCRIPTION: Renders a red box of size 44x83 starting at (23, 48).
; PLAN: r0=23(x), r1=48(y), r2=44(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 48
LDI r2, 44
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
