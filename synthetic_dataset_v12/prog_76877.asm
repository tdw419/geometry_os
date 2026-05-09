; DESCRIPTION: Creates a green rectangular region at (387, 20) spanning 51 by 49 pixels.
; PLAN: r0=387(x), r1=20(y), r2=51(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 20
LDI r2, 51
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
