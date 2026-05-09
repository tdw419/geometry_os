; DESCRIPTION: Renders a blue box of size 24x55 starting at (487, 112).
; PLAN: r0=487(x), r1=112(y), r2=24(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 112
LDI r2, 24
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
