; DESCRIPTION: Renders a black box of size 110x109 starting at (277, 109).
; PLAN: r0=277(x), r1=109(y), r2=110(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 109
LDI r2, 110
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
