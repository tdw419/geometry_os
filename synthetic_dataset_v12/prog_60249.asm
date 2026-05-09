; DESCRIPTION: Renders a cyan box of size 89x100 starting at (323, 94).
; PLAN: r0=323(x), r1=94(y), r2=89(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 94
LDI r2, 89
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
