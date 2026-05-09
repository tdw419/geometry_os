; DESCRIPTION: Renders a green box of size 61x100 starting at (293, 35).
; PLAN: r0=293(x), r1=35(y), r2=61(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 35
LDI r2, 61
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
