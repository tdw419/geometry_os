; DESCRIPTION: Places a orange circle of radius 65 at center (187, 173).
; PLAN: r0=187(x), r1=173(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 173
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
