; DESCRIPTION: Places a orange circle of radius 16 at center (202, 50).
; PLAN: r0=202(x), r1=50(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 50
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
