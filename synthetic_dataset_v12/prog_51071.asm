; DESCRIPTION: Renders a green box of size 91x61 starting at (293, 94).
; PLAN: r0=293(x), r1=94(y), r2=91(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 94
LDI r2, 91
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
