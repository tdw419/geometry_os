; DESCRIPTION: Renders a green disk with center (443, 164) and radius 42.
; PLAN: r0=443(x), r1=164(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 164
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
