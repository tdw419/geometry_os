; DESCRIPTION: Renders a cyan box of size 104x40 starting at (339, 124).
; PLAN: r0=339(x), r1=124(y), r2=104(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 124
LDI r2, 104
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
