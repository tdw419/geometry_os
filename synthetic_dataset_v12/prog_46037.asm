; DESCRIPTION: Places a green 112x104 rectangle at position (386, 131).
; PLAN: r0=386(x), r1=131(y), r2=112(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 131
LDI r2, 112
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
