; DESCRIPTION: Places a orange circle of radius 26 at center (243, 152).
; PLAN: r0=243(x), r1=152(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 152
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
