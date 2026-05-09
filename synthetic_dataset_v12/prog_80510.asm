; DESCRIPTION: Renders a black box of size 47x58 starting at (198, 134).
; PLAN: r0=198(x), r1=134(y), r2=47(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 134
LDI r2, 47
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
