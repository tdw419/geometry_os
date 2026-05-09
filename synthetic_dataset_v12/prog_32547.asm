; DESCRIPTION: Renders a black box of size 79x51 starting at (168, 177).
; PLAN: r0=168(x), r1=177(y), r2=79(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 177
LDI r2, 79
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
