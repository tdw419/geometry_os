; DESCRIPTION: Renders a cyan box of size 14x116 starting at (71, 35).
; PLAN: r0=71(x), r1=35(y), r2=14(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 35
LDI r2, 14
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
