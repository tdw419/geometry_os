; DESCRIPTION: Renders a white box of size 93x54 starting at (202, 24).
; PLAN: r0=202(x), r1=24(y), r2=93(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 24
LDI r2, 93
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
