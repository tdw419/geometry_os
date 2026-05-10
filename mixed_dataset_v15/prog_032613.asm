; DESCRIPTION: Renders a green rectangular region spanning 99 by 75 at (346, 68).
; PLAN: r0=346(x), r1=68(y), r2=99(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 68
LDI r2, 99
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
