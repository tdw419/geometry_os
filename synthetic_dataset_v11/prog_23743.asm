; DESCRIPTION: Renders a red box of size 58x44 starting at (92, 132).
; PLAN: r0=92(x), r1=132(y), r2=58(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 132
LDI r2, 58
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
