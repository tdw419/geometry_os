; DESCRIPTION: Renders a cyan box of size 57x116 starting at (88, 20).
; PLAN: r0=88(x), r1=20(y), r2=57(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 20
LDI r2, 57
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
