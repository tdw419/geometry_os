; DESCRIPTION: Renders a white box of size 27x17 starting at (293, 163).
; PLAN: r0=293(x), r1=163(y), r2=27(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 163
LDI r2, 27
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
