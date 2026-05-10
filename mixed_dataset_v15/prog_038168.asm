; DESCRIPTION: Creates a yellow rectangular region at (294, 61) spanning 83 by 91 pixels.
; PLAN: r0=294(x), r1=61(y), r2=83(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 61
LDI r2, 83
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
