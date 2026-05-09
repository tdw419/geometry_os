; DESCRIPTION: Renders a green box of size 21x79 starting at (160, 0).
; PLAN: r0=160(x), r1=0(y), r2=21(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 0
LDI r2, 21
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
