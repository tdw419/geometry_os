; DESCRIPTION: Renders a yellow box of size 118x47 starting at (260, 95).
; PLAN: r0=260(x), r1=95(y), r2=118(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 95
LDI r2, 118
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
