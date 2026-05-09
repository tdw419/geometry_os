; DESCRIPTION: Places a yellow 63x14 rectangle at position (141, 186).
; PLAN: r0=141(x), r1=186(y), r2=63(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 186
LDI r2, 63
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
