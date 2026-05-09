; DESCRIPTION: Renders a purple box of size 53x53 starting at (275, 89).
; PLAN: r0=275(x), r1=89(y), r2=53(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 89
LDI r2, 53
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
