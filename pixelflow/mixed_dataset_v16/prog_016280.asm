; DESCRIPTION: Renders a green box of size 11x77 starting at (135, 80).
; PLAN: r0=135(x), r1=80(y), r2=11(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 80
LDI r2, 11
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
