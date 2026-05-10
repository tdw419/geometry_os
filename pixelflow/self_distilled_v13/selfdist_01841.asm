; DESCRIPTION: Renders a yellow rectangular region spanning 15 by 48 at (151, 146).
; PLAN: r0=151(x), r1=146(y), r2=15(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 146
LDI r2, 15
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
