; DESCRIPTION: Renders a cyan box of size 66x76 starting at (75, 20).
; PLAN: r0=75(x), r1=20(y), r2=66(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 20
LDI r2, 66
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
