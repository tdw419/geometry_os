; DESCRIPTION: Places a black 24x68 rectangle at position (347, 55).
; PLAN: r0=347(x), r1=55(y), r2=24(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 55
LDI r2, 24
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
