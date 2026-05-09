; DESCRIPTION: Places a yellow 58x24 rectangle at position (208, 75).
; PLAN: r0=208(x), r1=75(y), r2=58(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 75
LDI r2, 58
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
