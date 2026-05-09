; DESCRIPTION: Renders a black box of size 79x81 starting at (146, 57).
; PLAN: r0=146(x), r1=57(y), r2=79(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 57
LDI r2, 79
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
