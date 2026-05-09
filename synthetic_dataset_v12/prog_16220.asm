; DESCRIPTION: Renders a cyan box of size 25x25 starting at (467, 229).
; PLAN: r0=467(x), r1=229(y), r2=25(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 229
LDI r2, 25
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
