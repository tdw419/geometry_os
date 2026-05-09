; DESCRIPTION: Creates a green rectangular region at (36, 186) spanning 99 by 50 pixels.
; PLAN: r0=36(x), r1=186(y), r2=99(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 186
LDI r2, 99
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
