; DESCRIPTION: Renders a cyan box of size 120x104 starting at (93, 109).
; PLAN: r0=93(x), r1=109(y), r2=120(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 109
LDI r2, 120
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
