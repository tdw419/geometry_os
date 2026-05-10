; DESCRIPTION: Renders a yellow box of size 12x72 starting at (293, 164).
; PLAN: r0=293(x), r1=164(y), r2=12(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 164
LDI r2, 12
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
