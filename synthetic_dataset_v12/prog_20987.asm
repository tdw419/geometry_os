; DESCRIPTION: Places a black 21x92 rectangle at position (1, 107).
; PLAN: r0=1(x), r1=107(y), r2=21(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 107
LDI r2, 21
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
