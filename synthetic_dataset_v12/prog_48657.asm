; DESCRIPTION: Places a yellow 10x11 rectangle at position (147, 174).
; PLAN: r0=147(x), r1=174(y), r2=10(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 174
LDI r2, 10
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
