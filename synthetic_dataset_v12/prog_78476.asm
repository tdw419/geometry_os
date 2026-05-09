; DESCRIPTION: Renders a yellow box of size 75x55 starting at (277, 180).
; PLAN: r0=277(x), r1=180(y), r2=75(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 180
LDI r2, 75
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
