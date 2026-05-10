; DESCRIPTION: Renders a green box of size 77x47 starting at (80, 45).
; PLAN: r0=80(x), r1=45(y), r2=77(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 45
LDI r2, 77
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
