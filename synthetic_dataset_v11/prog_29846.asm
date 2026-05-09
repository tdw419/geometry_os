; DESCRIPTION: Renders a black box of size 117x74 starting at (48, 174).
; PLAN: r0=48(x), r1=174(y), r2=117(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 174
LDI r2, 117
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
