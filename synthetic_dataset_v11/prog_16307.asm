; DESCRIPTION: Renders a blue box of size 28x20 starting at (171, 50).
; PLAN: r0=171(x), r1=50(y), r2=28(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 50
LDI r2, 28
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
