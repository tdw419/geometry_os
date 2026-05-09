; DESCRIPTION: Renders a cyan box of size 65x47 starting at (9, 139).
; PLAN: r0=9(x), r1=139(y), r2=65(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 139
LDI r2, 65
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
