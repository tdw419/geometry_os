; DESCRIPTION: Places a green 33x116 box at position (232, 124).
; PLAN: r0=232(x), r1=124(y), r2=33(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 124
LDI r2, 33
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
