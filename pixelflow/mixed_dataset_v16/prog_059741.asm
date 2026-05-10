; DESCRIPTION: Renders a red box of size 82x41 starting at (163, 137).
; PLAN: r0=163(x), r1=137(y), r2=82(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 137
LDI r2, 82
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
