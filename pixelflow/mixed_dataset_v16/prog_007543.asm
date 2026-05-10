; DESCRIPTION: Renders a cyan box of size 74x95 starting at (209, 45).
; PLAN: r0=209(x), r1=45(y), r2=74(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 45
LDI r2, 74
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
