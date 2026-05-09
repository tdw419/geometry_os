; DESCRIPTION: Renders a orange box of size 36x86 starting at (121, 36).
; PLAN: r0=121(x), r1=36(y), r2=36(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 36
LDI r2, 36
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
