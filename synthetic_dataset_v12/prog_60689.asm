; DESCRIPTION: Renders a green box of size 83x25 starting at (293, 61).
; PLAN: r0=293(x), r1=61(y), r2=83(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 61
LDI r2, 83
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
