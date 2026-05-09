; DESCRIPTION: Creates a red circular shape at (392, 108) with radius 57.
; PLAN: r0=392(x), r1=108(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 108
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
