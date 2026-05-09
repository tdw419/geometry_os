; DESCRIPTION: Renders a yellow box of size 72x70 starting at (38, 152).
; PLAN: r0=38(x), r1=152(y), r2=72(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 152
LDI r2, 72
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
