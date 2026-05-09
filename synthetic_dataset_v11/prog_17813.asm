; DESCRIPTION: Renders a cyan box of size 47x19 starting at (188, 44).
; PLAN: r0=188(x), r1=44(y), r2=47(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 44
LDI r2, 47
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
