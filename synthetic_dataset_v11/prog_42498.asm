; DESCRIPTION: Places a orange circle of radius 33 at center (46, 174).
; PLAN: r0=46(x), r1=174(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 174
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
