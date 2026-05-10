; DESCRIPTION: Renders a red circular shape at (202, 164) with radius 64.
; PLAN: r0=202(x), r1=164(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 164
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
