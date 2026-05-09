; DESCRIPTION: Renders a red box of size 17x90 starting at (103, 165).
; PLAN: r0=103(x), r1=165(y), r2=17(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 165
LDI r2, 17
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
