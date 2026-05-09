; DESCRIPTION: Renders a orange box of size 120x92 starting at (172, 138).
; PLAN: r0=172(x), r1=138(y), r2=120(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 138
LDI r2, 120
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
