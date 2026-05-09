; DESCRIPTION: Places a black 35x55 rectangle at position (242, 99).
; PLAN: r0=242(x), r1=99(y), r2=35(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 99
LDI r2, 35
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
