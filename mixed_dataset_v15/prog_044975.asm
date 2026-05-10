; DESCRIPTION: Creates a yellow rectangular region at (365, 147) spanning 77 by 46 pixels.
; PLAN: r0=365(x), r1=147(y), r2=77(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 147
LDI r2, 77
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
