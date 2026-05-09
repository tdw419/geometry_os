; DESCRIPTION: Renders a blue box of size 12x91 starting at (365, 109).
; PLAN: r0=365(x), r1=109(y), r2=12(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 109
LDI r2, 12
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
