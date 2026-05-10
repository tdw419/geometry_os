; DESCRIPTION: Creates a black rectangular region at (242, 95) spanning 59 by 94 pixels.
; PLAN: r0=242(x), r1=95(y), r2=59(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 95
LDI r2, 59
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
