; DESCRIPTION: Renders a red box of size 50x17 starting at (82, 208).
; PLAN: r0=82(x), r1=208(y), r2=50(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 208
LDI r2, 50
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
