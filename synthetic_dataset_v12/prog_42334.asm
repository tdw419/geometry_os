; DESCRIPTION: Renders a orange box of size 99x17 starting at (251, 213).
; PLAN: r0=251(x), r1=213(y), r2=99(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 213
LDI r2, 99
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
