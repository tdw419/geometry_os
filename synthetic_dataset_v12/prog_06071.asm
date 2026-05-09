; DESCRIPTION: Renders a cyan box of size 35x79 starting at (334, 104).
; PLAN: r0=334(x), r1=104(y), r2=35(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 104
LDI r2, 35
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
