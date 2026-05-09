; DESCRIPTION: Creates a yellow rectangular region at (242, 4) spanning 44 by 38 pixels.
; PLAN: r0=242(x), r1=4(y), r2=44(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 4
LDI r2, 44
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
