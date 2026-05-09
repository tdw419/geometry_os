; DESCRIPTION: Renders a red box of size 92x116 starting at (365, 28).
; PLAN: r0=365(x), r1=28(y), r2=92(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 28
LDI r2, 92
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
