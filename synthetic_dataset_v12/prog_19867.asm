; DESCRIPTION: Renders a orange box of size 44x77 starting at (121, 37).
; PLAN: r0=121(x), r1=37(y), r2=44(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 37
LDI r2, 44
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
