; DESCRIPTION: Places a red circle of radius 70 at center (168, 139).
; PLAN: r0=168(x), r1=139(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 139
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
