; DESCRIPTION: Renders a cyan box of size 81x72 starting at (75, 67).
; PLAN: r0=75(x), r1=67(y), r2=81(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 67
LDI r2, 81
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
