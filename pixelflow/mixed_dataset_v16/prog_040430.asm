; DESCRIPTION: Creates a purple circular shape at (294, 146) with radius 41.
; PLAN: r0=294(x), r1=146(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 146
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
