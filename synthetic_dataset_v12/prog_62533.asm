; DESCRIPTION: Renders a cyan box of size 93x26 starting at (355, 120).
; PLAN: r0=355(x), r1=120(y), r2=93(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 120
LDI r2, 93
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
