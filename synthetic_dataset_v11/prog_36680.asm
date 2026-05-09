; DESCRIPTION: Renders a green box of size 39x85 starting at (137, 152).
; PLAN: r0=137(x), r1=152(y), r2=39(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 152
LDI r2, 39
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
