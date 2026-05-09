; DESCRIPTION: Renders a black box of size 47x57 starting at (98, 79).
; PLAN: r0=98(x), r1=79(y), r2=47(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 79
LDI r2, 47
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
