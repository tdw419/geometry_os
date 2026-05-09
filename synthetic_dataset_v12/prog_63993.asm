; DESCRIPTION: Renders a red box of size 48x81 starting at (221, 127).
; PLAN: r0=221(x), r1=127(y), r2=48(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 127
LDI r2, 48
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
