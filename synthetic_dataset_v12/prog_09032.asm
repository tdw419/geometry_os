; DESCRIPTION: Places a orange circle of radius 65 at center (296, 128).
; PLAN: r0=296(x), r1=128(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 128
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
