; DESCRIPTION: Places a green 58x33 rectangle at position (317, 44).
; PLAN: r0=317(x), r1=44(y), r2=58(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 44
LDI r2, 58
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
