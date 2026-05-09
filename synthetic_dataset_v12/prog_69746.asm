; DESCRIPTION: Renders a yellow box of size 47x12 starting at (202, 50).
; PLAN: r0=202(x), r1=50(y), r2=47(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 50
LDI r2, 47
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
