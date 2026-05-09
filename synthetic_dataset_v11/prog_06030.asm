; DESCRIPTION: Places a green 102x75 rectangle at position (124, 152).
; PLAN: r0=124(x), r1=152(y), r2=102(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 152
LDI r2, 102
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
