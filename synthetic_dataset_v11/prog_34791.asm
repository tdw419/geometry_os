; DESCRIPTION: Renders a yellow box of size 90x120 starting at (104, 83).
; PLAN: r0=104(x), r1=83(y), r2=90(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 83
LDI r2, 90
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
