; DESCRIPTION: Renders a green box of size 31x80 starting at (277, 58).
; PLAN: r0=277(x), r1=58(y), r2=31(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 58
LDI r2, 31
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
