; DESCRIPTION: Creates a yellow rectangular region at (242, 68) spanning 111 by 100 pixels.
; PLAN: r0=242(x), r1=68(y), r2=111(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 68
LDI r2, 111
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
