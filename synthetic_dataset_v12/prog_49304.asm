; DESCRIPTION: Renders a black box of size 50x115 starting at (125, 131).
; PLAN: r0=125(x), r1=131(y), r2=50(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 131
LDI r2, 50
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
