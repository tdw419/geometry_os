; DESCRIPTION: Renders a black box of size 27x117 starting at (179, 57).
; PLAN: r0=179(x), r1=57(y), r2=27(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 57
LDI r2, 27
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
