; DESCRIPTION: Creates a red circular shape at (146, 215) with radius 36.
; PLAN: r0=146(x), r1=215(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 215
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
