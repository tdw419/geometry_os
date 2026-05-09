; DESCRIPTION: Renders a cyan box of size 90x104 starting at (185, 67).
; PLAN: r0=185(x), r1=67(y), r2=90(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 67
LDI r2, 90
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
