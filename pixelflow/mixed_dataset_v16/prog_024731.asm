; DESCRIPTION: Creates a yellow rectangular region at (242, 174) spanning 100 by 71 pixels.
; PLAN: r0=242(x), r1=174(y), r2=100(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 174
LDI r2, 100
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
