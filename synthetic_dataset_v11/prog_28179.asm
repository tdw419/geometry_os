; DESCRIPTION: Renders a orange box of size 60x98 starting at (90, 7).
; PLAN: r0=90(x), r1=7(y), r2=60(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 7
LDI r2, 60
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
