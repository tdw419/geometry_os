; DESCRIPTION: Places a magenta 27x16 rectangle at position (441, 147).
; PLAN: r0=441(x), r1=147(y), r2=27(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 147
LDI r2, 27
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
