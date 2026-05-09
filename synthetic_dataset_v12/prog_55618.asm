; DESCRIPTION: Renders a cyan box of size 67x93 starting at (424, 89).
; PLAN: r0=424(x), r1=89(y), r2=67(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 89
LDI r2, 67
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
