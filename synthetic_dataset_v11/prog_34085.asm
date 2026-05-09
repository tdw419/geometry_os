; DESCRIPTION: Renders a orange box of size 104x45 starting at (36, 70).
; PLAN: r0=36(x), r1=70(y), r2=104(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 70
LDI r2, 104
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
