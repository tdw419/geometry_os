; DESCRIPTION: Renders a green box of size 92x21 starting at (371, 152).
; PLAN: r0=371(x), r1=152(y), r2=92(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 152
LDI r2, 92
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
