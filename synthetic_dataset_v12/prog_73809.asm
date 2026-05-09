; DESCRIPTION: Renders a orange box of size 82x120 starting at (7, 25).
; PLAN: r0=7(x), r1=25(y), r2=82(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 25
LDI r2, 82
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
