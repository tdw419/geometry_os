; DESCRIPTION: Renders a green box of size 102x54 starting at (146, 20).
; PLAN: r0=146(x), r1=20(y), r2=102(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 20
LDI r2, 102
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
