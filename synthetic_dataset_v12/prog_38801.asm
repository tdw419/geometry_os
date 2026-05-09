; DESCRIPTION: Renders a yellow box of size 118x80 starting at (284, 29).
; PLAN: r0=284(x), r1=29(y), r2=118(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 29
LDI r2, 118
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
