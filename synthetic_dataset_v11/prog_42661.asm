; DESCRIPTION: Renders a cyan box of size 81x87 starting at (96, 40).
; PLAN: r0=96(x), r1=40(y), r2=81(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 40
LDI r2, 81
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
