; DESCRIPTION: Renders a cyan box of size 71x116 starting at (160, 96).
; PLAN: r0=160(x), r1=96(y), r2=71(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 96
LDI r2, 71
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
