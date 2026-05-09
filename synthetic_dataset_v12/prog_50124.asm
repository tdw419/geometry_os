; DESCRIPTION: Renders a red box of size 28x41 starting at (92, 174).
; PLAN: r0=92(x), r1=174(y), r2=28(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 174
LDI r2, 28
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
