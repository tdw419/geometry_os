; DESCRIPTION: Renders a red disk with center (206, 79) and radius 29.
; PLAN: r0=206(x), r1=79(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 79
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
