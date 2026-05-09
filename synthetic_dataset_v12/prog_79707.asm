; DESCRIPTION: Places a cyan 52x40 rectangle at position (152, 147).
; PLAN: r0=152(x), r1=147(y), r2=52(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 147
LDI r2, 52
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
