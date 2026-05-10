; DESCRIPTION: Creates a green rectangular region at (298, 10) spanning 81 by 75 pixels.
; PLAN: r0=298(x), r1=10(y), r2=81(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 10
LDI r2, 81
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
