; DESCRIPTION: Renders a black box of size 70x72 starting at (330, 177).
; PLAN: r0=330(x), r1=177(y), r2=70(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 177
LDI r2, 70
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
