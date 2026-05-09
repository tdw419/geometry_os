; DESCRIPTION: Composite: Places a orange dot at position (238, 58) then Creates a purple circular shape at (305, 168) with radius 70.
; PLAN: r0=238(x), r1=58(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=168(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 238
LDI r1, 58
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 305
LDI r6, 168
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
