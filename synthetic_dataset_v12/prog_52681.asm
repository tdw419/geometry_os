; DESCRIPTION: Renders a yellow box of size 75x92 starting at (217, 80).
; PLAN: r0=217(x), r1=80(y), r2=75(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 80
LDI r2, 75
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
