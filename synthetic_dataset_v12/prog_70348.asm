; DESCRIPTION: Renders a green box of size 38x74 starting at (370, 166).
; PLAN: r0=370(x), r1=166(y), r2=38(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 166
LDI r2, 38
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
