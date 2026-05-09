; DESCRIPTION: Places a black 20x46 rectangle at position (383, 92).
; PLAN: r0=383(x), r1=92(y), r2=20(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 92
LDI r2, 20
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
