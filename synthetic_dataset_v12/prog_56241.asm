; DESCRIPTION: Renders a orange disk with center (74, 205) and radius 42.
; PLAN: r0=74(x), r1=205(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 205
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
