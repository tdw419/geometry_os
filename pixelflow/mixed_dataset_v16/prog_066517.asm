; DESCRIPTION: Places a black 89x59 rectangle at position (164, 55).
; PLAN: r0=164(x), r1=55(y), r2=89(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 55
LDI r2, 89
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
