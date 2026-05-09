; DESCRIPTION: Renders a white box of size 92x45 starting at (293, 175).
; PLAN: r0=293(x), r1=175(y), r2=92(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 175
LDI r2, 92
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
