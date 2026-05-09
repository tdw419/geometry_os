; DESCRIPTION: Places a green 31x24 rectangle at position (82, 147).
; PLAN: r0=82(x), r1=147(y), r2=31(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 147
LDI r2, 31
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
