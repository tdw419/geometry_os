; DESCRIPTION: Renders a red box of size 25x120 starting at (443, 92).
; PLAN: r0=443(x), r1=92(y), r2=25(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 92
LDI r2, 25
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
