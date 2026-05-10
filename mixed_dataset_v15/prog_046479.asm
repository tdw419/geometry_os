; DESCRIPTION: Creates a cyan rectangular region at (58, 147) spanning 91 by 51 pixels.
; PLAN: r0=58(x), r1=147(y), r2=91(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 147
LDI r2, 91
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
