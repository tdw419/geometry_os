; DESCRIPTION: Renders a cyan box of size 54x100 starting at (201, 89).
; PLAN: r0=201(x), r1=89(y), r2=54(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 89
LDI r2, 54
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
