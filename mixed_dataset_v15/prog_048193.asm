; DESCRIPTION: Creates a red circular shape at (180, 206) with radius 31.
; PLAN: r0=180(x), r1=206(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 206
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
