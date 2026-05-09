; DESCRIPTION: Places a black 10x116 rectangle at position (146, 22).
; PLAN: r0=146(x), r1=22(y), r2=10(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 22
LDI r2, 10
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
