; DESCRIPTION: Renders a green box of size 55x79 starting at (185, 172).
; PLAN: r0=185(x), r1=172(y), r2=55(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 172
LDI r2, 55
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
