; DESCRIPTION: Renders a cyan box of size 44x22 starting at (162, 75).
; PLAN: r0=162(x), r1=75(y), r2=44(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 75
LDI r2, 44
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
