; DESCRIPTION: Renders a orange box of size 71x68 starting at (333, 161).
; PLAN: r0=333(x), r1=161(y), r2=71(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 161
LDI r2, 71
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
