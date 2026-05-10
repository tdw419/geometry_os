; DESCRIPTION: Renders a green rectangular region spanning 95 by 24 at (277, 192).
; PLAN: r0=277(x), r1=192(y), r2=95(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 192
LDI r2, 95
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
