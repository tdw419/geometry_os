; DESCRIPTION: Creates a yellow rectangular region at (391, 98) spanning 33 by 120 pixels.
; PLAN: r0=391(x), r1=98(y), r2=33(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 98
LDI r2, 33
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
