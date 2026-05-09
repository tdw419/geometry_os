; DESCRIPTION: Places a orange circle of radius 26 at center (228, 180).
; PLAN: r0=228(x), r1=180(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 180
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
