; DESCRIPTION: Places a green 53x33 rectangle at position (48, 92).
; PLAN: r0=48(x), r1=92(y), r2=53(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 92
LDI r2, 53
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
