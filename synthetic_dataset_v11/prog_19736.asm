; DESCRIPTION: Places a yellow 30x24 rectangle at position (148, 127).
; PLAN: r0=148(x), r1=127(y), r2=30(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 127
LDI r2, 30
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
