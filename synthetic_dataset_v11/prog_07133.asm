; DESCRIPTION: Renders a orange box of size 40x90 starting at (87, 25).
; PLAN: r0=87(x), r1=25(y), r2=40(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 25
LDI r2, 40
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
