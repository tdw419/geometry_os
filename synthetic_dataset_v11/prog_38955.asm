; DESCRIPTION: Renders a green box of size 12x116 starting at (156, 112).
; PLAN: r0=156(x), r1=112(y), r2=12(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 112
LDI r2, 12
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
