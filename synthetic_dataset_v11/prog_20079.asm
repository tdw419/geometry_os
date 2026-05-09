; DESCRIPTION: Renders a orange box of size 15x82 starting at (27, 17).
; PLAN: r0=27(x), r1=17(y), r2=15(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 17
LDI r2, 15
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
