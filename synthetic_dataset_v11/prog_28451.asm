; DESCRIPTION: Renders a black box of size 110x86 starting at (44, 124).
; PLAN: r0=44(x), r1=124(y), r2=110(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 124
LDI r2, 110
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
