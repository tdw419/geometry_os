; DESCRIPTION: Renders a cyan box of size 55x94 starting at (445, 1).
; PLAN: r0=445(x), r1=1(y), r2=55(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 1
LDI r2, 55
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
