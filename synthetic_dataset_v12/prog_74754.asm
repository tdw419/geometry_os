; DESCRIPTION: Renders a orange box of size 25x80 starting at (373, 64).
; PLAN: r0=373(x), r1=64(y), r2=25(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 64
LDI r2, 25
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
