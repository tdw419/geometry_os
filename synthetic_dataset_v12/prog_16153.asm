; DESCRIPTION: Renders a cyan box of size 102x22 starting at (66, 27).
; PLAN: r0=66(x), r1=27(y), r2=102(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 27
LDI r2, 102
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
