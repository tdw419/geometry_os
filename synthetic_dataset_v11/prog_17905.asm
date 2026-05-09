; DESCRIPTION: Renders a green box of size 119x56 starting at (120, 124).
; PLAN: r0=120(x), r1=124(y), r2=119(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 124
LDI r2, 119
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
