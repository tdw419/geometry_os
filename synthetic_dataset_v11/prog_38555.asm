; DESCRIPTION: Renders a orange box of size 71x104 starting at (143, 131).
; PLAN: r0=143(x), r1=131(y), r2=71(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 131
LDI r2, 71
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
