; DESCRIPTION: Renders a cyan box of size 22x45 starting at (162, 174).
; PLAN: r0=162(x), r1=174(y), r2=22(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 174
LDI r2, 22
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
