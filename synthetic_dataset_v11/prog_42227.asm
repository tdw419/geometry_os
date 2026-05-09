; DESCRIPTION: Renders a cyan box of size 29x17 starting at (179, 196).
; PLAN: r0=179(x), r1=196(y), r2=29(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 196
LDI r2, 29
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
