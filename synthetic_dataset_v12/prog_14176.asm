; DESCRIPTION: Renders a cyan box of size 85x66 starting at (3, 2).
; PLAN: r0=3(x), r1=2(y), r2=85(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 2
LDI r2, 85
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
