; DESCRIPTION: Places a green 72x55 rectangle at position (139, 132).
; PLAN: r0=139(x), r1=132(y), r2=72(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 132
LDI r2, 72
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
