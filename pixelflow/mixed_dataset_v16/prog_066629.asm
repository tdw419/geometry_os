; DESCRIPTION: Places a green 55x32 rectangle at position (431, 207).
; PLAN: r0=431(x), r1=207(y), r2=55(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 207
LDI r2, 55
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
