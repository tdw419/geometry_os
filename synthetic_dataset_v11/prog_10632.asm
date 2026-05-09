; DESCRIPTION: Renders a cyan box of size 82x37 starting at (117, 102).
; PLAN: r0=117(x), r1=102(y), r2=82(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 102
LDI r2, 82
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
