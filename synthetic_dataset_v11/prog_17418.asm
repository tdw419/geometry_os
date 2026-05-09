; DESCRIPTION: Places a black 65x59 rectangle at position (123, 82).
; PLAN: r0=123(x), r1=82(y), r2=65(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 82
LDI r2, 65
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
