; DESCRIPTION: Renders a blue box of size 30x80 starting at (90, 164).
; PLAN: r0=90(x), r1=164(y), r2=30(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 164
LDI r2, 30
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
