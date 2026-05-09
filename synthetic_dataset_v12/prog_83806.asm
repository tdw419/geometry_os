; DESCRIPTION: Renders a cyan box of size 89x104 starting at (171, 140).
; PLAN: r0=171(x), r1=140(y), r2=89(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 140
LDI r2, 89
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
