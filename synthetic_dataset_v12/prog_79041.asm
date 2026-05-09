; DESCRIPTION: Renders a black box of size 58x120 starting at (185, 37).
; PLAN: r0=185(x), r1=37(y), r2=58(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 37
LDI r2, 58
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
