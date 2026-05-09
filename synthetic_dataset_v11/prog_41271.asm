; DESCRIPTION: Renders a red box of size 35x41 starting at (198, 107).
; PLAN: r0=198(x), r1=107(y), r2=35(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 107
LDI r2, 35
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
