; DESCRIPTION: Renders a cyan box of size 102x25 starting at (45, 45).
; PLAN: r0=45(x), r1=45(y), r2=102(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 45
LDI r2, 102
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
