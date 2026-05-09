; DESCRIPTION: Renders a cyan box of size 95x49 starting at (409, 65).
; PLAN: r0=409(x), r1=65(y), r2=95(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 65
LDI r2, 95
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
