; DESCRIPTION: Creates a yellow rectangular region at (218, 126) spanning 18 by 91 pixels.
; PLAN: r0=218(x), r1=126(y), r2=18(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 126
LDI r2, 18
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
