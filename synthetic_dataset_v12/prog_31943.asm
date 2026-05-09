; DESCRIPTION: Renders a black box of size 57x68 starting at (276, 177).
; PLAN: r0=276(x), r1=177(y), r2=57(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 177
LDI r2, 57
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
