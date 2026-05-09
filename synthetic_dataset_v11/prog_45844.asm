; DESCRIPTION: Places a green 71x116 rectangle at position (142, 127).
; PLAN: r0=142(x), r1=127(y), r2=71(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 127
LDI r2, 71
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
