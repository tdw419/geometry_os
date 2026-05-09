; DESCRIPTION: Places a yellow 55x73 rectangle at position (308, 51).
; PLAN: r0=308(x), r1=51(y), r2=55(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 51
LDI r2, 55
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
