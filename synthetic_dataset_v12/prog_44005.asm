; DESCRIPTION: Renders a red box of size 55x120 starting at (214, 119).
; PLAN: r0=214(x), r1=119(y), r2=55(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 119
LDI r2, 55
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
