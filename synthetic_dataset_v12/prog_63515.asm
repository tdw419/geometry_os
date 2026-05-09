; DESCRIPTION: Renders a red box of size 36x10 starting at (82, 174).
; PLAN: r0=82(x), r1=174(y), r2=36(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 174
LDI r2, 36
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
