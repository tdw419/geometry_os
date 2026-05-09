; DESCRIPTION: Renders a cyan box of size 27x85 starting at (91, 102).
; PLAN: r0=91(x), r1=102(y), r2=27(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 102
LDI r2, 27
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
