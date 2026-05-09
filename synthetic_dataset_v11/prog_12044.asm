; DESCRIPTION: Renders a green box of size 50x62 starting at (202, 44).
; PLAN: r0=202(x), r1=44(y), r2=50(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 44
LDI r2, 50
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
