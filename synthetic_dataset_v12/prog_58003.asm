; DESCRIPTION: Creates a orange circular shape at (307, 194) with radius 46.
; PLAN: r0=307(x), r1=194(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 194
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
