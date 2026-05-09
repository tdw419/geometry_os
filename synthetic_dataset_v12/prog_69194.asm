; DESCRIPTION: Renders a orange box of size 36x104 starting at (172, 73).
; PLAN: r0=172(x), r1=73(y), r2=36(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 73
LDI r2, 36
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
