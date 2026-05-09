; DESCRIPTION: Renders a white box of size 103x62 starting at (202, 163).
; PLAN: r0=202(x), r1=163(y), r2=103(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 163
LDI r2, 103
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
