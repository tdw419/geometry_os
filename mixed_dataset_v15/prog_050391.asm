; DESCRIPTION: Renders a cyan box of size 67x98 starting at (419, 65).
; PLAN: r0=419(x), r1=65(y), r2=67(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 65
LDI r2, 67
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
