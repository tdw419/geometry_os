; DESCRIPTION: Renders a yellow box of size 107x39 starting at (293, 21).
; PLAN: r0=293(x), r1=21(y), r2=107(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 21
LDI r2, 107
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
