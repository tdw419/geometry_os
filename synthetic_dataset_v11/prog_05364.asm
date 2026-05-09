; DESCRIPTION: Renders a cyan box of size 73x104 starting at (44, 35).
; PLAN: r0=44(x), r1=35(y), r2=73(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 35
LDI r2, 73
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
