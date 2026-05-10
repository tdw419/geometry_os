; DESCRIPTION: Creates a vertical yellow gradient from black to yellow.
; PLAN: r0=0(x), r1=14(y), r2=0(width), r3=1(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 14
LDI r2, 0
LDI r3, 1
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
