; DESCRIPTION: Places a green 68x77 rectangle at position (172, 147).
; PLAN: r0=172(x), r1=147(y), r2=68(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 147
LDI r2, 68
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
