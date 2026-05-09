; DESCRIPTION: Renders a orange box of size 60x33 starting at (71, 144).
; PLAN: r0=71(x), r1=144(y), r2=60(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 144
LDI r2, 60
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
