; DESCRIPTION: Renders a yellow box of size 47x115 starting at (388, 107).
; PLAN: r0=388(x), r1=107(y), r2=47(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 107
LDI r2, 47
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
