; DESCRIPTION: Renders a orange box of size 51x116 starting at (18, 117).
; PLAN: r0=18(x), r1=117(y), r2=51(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 117
LDI r2, 51
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
