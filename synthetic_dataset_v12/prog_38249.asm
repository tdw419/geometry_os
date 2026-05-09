; DESCRIPTION: Renders a green box of size 95x77 starting at (298, 145).
; PLAN: r0=298(x), r1=145(y), r2=95(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 145
LDI r2, 95
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
