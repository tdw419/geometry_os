; DESCRIPTION: Places a yellow 19x116 rectangle at position (177, 40).
; PLAN: r0=177(x), r1=40(y), r2=19(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 40
LDI r2, 19
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
