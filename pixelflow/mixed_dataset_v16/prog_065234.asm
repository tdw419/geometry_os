; DESCRIPTION: Renders a cyan box of size 57x36 starting at (311, 25).
; PLAN: r0=311(x), r1=25(y), r2=57(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 25
LDI r2, 57
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
