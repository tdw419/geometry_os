; DESCRIPTION: Places a yellow 12x117 rectangle at position (55, 37).
; PLAN: r0=55(x), r1=37(y), r2=12(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 37
LDI r2, 12
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
