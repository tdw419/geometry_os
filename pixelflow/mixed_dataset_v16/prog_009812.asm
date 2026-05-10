; DESCRIPTION: Renders a red circular shape at (185, 146) with radius 16.
; PLAN: r0=185(x), r1=146(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 146
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
