; DESCRIPTION: Renders a red box of size 42x44 starting at (187, 41).
; PLAN: r0=187(x), r1=41(y), r2=42(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 41
LDI r2, 42
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
