; DESCRIPTION: Renders a yellow box of size 68x36 starting at (293, 75).
; PLAN: r0=293(x), r1=75(y), r2=68(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 75
LDI r2, 68
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
