; DESCRIPTION: Places a yellow 55x71 rectangle at position (1, 80).
; PLAN: r0=1(x), r1=80(y), r2=55(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 80
LDI r2, 55
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
