; DESCRIPTION: Places a red circle of radius 50 at center (87, 174).
; PLAN: r0=87(x), r1=174(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 174
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
