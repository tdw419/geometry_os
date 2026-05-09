; DESCRIPTION: Renders a cyan box of size 52x102 starting at (70, 31).
; PLAN: r0=70(x), r1=31(y), r2=52(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 31
LDI r2, 52
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
