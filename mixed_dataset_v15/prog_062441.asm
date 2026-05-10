; DESCRIPTION: Places a orange circle of radius 73 at center (146, 150).
; PLAN: r0=146(x), r1=150(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 150
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
