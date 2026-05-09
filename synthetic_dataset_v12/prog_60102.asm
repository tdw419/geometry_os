; DESCRIPTION: Places a yellow 10x45 rectangle at position (186, 112).
; PLAN: r0=186(x), r1=112(y), r2=10(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 112
LDI r2, 10
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
