; DESCRIPTION: Creates a vertical yellow gradient from black to yellow.
; PLAN: r0=0(x), r1=18(y), r2=0(width), r3=0(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 18
LDI r2, 0
LDI r3, 0
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
