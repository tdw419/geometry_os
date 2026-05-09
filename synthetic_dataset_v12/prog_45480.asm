; DESCRIPTION: Places a green 79x120 rectangle at position (388, 59).
; PLAN: r0=388(x), r1=59(y), r2=79(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 59
LDI r2, 79
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
