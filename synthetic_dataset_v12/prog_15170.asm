; DESCRIPTION: Renders a cyan box of size 114x72 starting at (73, 104).
; PLAN: r0=73(x), r1=104(y), r2=114(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 104
LDI r2, 114
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
