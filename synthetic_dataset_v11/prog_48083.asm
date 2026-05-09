; DESCRIPTION: Places a yellow 102x75 rectangle at position (136, 65).
; PLAN: r0=136(x), r1=65(y), r2=102(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 65
LDI r2, 102
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
