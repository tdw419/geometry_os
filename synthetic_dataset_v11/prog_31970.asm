; DESCRIPTION: Renders a green box of size 65x27 starting at (169, 142).
; PLAN: r0=169(x), r1=142(y), r2=65(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 142
LDI r2, 65
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
