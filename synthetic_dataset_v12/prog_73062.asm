; DESCRIPTION: Places a black 72x46 rectangle at position (220, 92).
; PLAN: r0=220(x), r1=92(y), r2=72(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 92
LDI r2, 72
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
