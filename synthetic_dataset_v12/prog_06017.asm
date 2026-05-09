; DESCRIPTION: Renders a cyan box of size 38x100 starting at (106, 34).
; PLAN: r0=106(x), r1=34(y), r2=38(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 34
LDI r2, 38
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
