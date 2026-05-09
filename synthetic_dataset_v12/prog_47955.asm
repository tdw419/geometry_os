; DESCRIPTION: Renders a blue box of size 39x79 starting at (81, 143).
; PLAN: r0=81(x), r1=143(y), r2=39(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 143
LDI r2, 39
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
