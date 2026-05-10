; DESCRIPTION: Places a yellow 101x116 rectangle at position (285, 119).
; PLAN: r0=285(x), r1=119(y), r2=101(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 119
LDI r2, 101
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
