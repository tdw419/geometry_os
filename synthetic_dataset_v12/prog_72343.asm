; DESCRIPTION: Places a yellow 48x116 rectangle at position (357, 96).
; PLAN: r0=357(x), r1=96(y), r2=48(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 96
LDI r2, 48
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
