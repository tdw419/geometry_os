; DESCRIPTION: Creates a yellow rectangular region at (131, 208) spanning 66 by 47 pixels.
; PLAN: r0=131(x), r1=208(y), r2=66(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 208
LDI r2, 66
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
