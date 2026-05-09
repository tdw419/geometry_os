; DESCRIPTION: Renders a orange box of size 17x48 starting at (234, 86).
; PLAN: r0=234(x), r1=86(y), r2=17(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 86
LDI r2, 17
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
