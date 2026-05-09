; DESCRIPTION: Renders a red box of size 15x111 starting at (165, 82).
; PLAN: r0=165(x), r1=82(y), r2=15(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 82
LDI r2, 15
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
