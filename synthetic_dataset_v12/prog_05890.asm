; DESCRIPTION: Renders a orange box of size 117x107 starting at (214, 64).
; PLAN: r0=214(x), r1=64(y), r2=117(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 64
LDI r2, 117
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
