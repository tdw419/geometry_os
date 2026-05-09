; DESCRIPTION: Renders a cyan box of size 98x100 starting at (342, 20).
; PLAN: r0=342(x), r1=20(y), r2=98(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 20
LDI r2, 98
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
