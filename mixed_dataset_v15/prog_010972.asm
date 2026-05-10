; DESCRIPTION: Renders a blue box of size 55x30 starting at (392, 7).
; PLAN: r0=392(x), r1=7(y), r2=55(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 7
LDI r2, 55
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
