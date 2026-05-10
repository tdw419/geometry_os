; DESCRIPTION: Renders a cyan box of size 27x75 starting at (26, 130).
; PLAN: r0=26(x), r1=130(y), r2=27(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 130
LDI r2, 27
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
