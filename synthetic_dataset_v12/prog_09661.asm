; DESCRIPTION: Creates a yellow rectangular region at (386, 80) spanning 92 by 89 pixels.
; PLAN: r0=386(x), r1=80(y), r2=92(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 80
LDI r2, 92
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
