; DESCRIPTION: Renders a red box of size 15x62 starting at (82, 171).
; PLAN: r0=82(x), r1=171(y), r2=15(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 171
LDI r2, 15
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
