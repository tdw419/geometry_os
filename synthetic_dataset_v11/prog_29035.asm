; DESCRIPTION: Renders a cyan box of size 36x89 starting at (154, 71).
; PLAN: r0=154(x), r1=71(y), r2=36(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 71
LDI r2, 36
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
