; DESCRIPTION: Renders a yellow box of size 42x72 starting at (268, 41).
; PLAN: r0=268(x), r1=41(y), r2=42(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 41
LDI r2, 42
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
