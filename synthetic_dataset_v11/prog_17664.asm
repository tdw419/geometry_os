; DESCRIPTION: Creates a red circular shape at (206, 141) with radius 50.
; PLAN: r0=206(x), r1=141(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 141
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
