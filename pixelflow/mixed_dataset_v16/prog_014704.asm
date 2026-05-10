; DESCRIPTION: Renders a cyan box of size 67x55 starting at (345, 55).
; PLAN: r0=345(x), r1=55(y), r2=67(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 55
LDI r2, 67
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
