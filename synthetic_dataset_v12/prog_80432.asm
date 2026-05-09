; DESCRIPTION: Renders a red disk with center (281, 50) and radius 47.
; PLAN: r0=281(x), r1=50(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 50
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
