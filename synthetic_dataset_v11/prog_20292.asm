; DESCRIPTION: Renders a cyan box of size 74x104 starting at (74, 28).
; PLAN: r0=74(x), r1=28(y), r2=74(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 28
LDI r2, 74
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
