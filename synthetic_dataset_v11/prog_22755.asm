; DESCRIPTION: Renders a cyan box of size 18x115 starting at (191, 13).
; PLAN: r0=191(x), r1=13(y), r2=18(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 13
LDI r2, 18
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
