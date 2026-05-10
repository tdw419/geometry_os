; DESCRIPTION: Renders a cyan box of size 44x26 starting at (315, 69).
; PLAN: r0=315(x), r1=69(y), r2=44(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 69
LDI r2, 44
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
