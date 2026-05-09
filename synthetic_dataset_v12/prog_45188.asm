; DESCRIPTION: Renders a green box of size 85x55 starting at (250, 177).
; PLAN: r0=250(x), r1=177(y), r2=85(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 177
LDI r2, 85
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
