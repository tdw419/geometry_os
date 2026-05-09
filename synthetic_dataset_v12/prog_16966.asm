; DESCRIPTION: Renders a orange disk with center (180, 164) and radius 46.
; PLAN: r0=180(x), r1=164(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 164
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
