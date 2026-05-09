; DESCRIPTION: Places a green 55x33 rectangle at position (379, 59).
; PLAN: r0=379(x), r1=59(y), r2=55(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 59
LDI r2, 55
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
