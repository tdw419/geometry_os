; DESCRIPTION: Renders a cyan box of size 109x104 starting at (84, 68).
; PLAN: r0=84(x), r1=68(y), r2=109(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 68
LDI r2, 109
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
