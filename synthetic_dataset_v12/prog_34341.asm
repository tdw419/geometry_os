; DESCRIPTION: Renders a green box of size 94x67 starting at (160, 180).
; PLAN: r0=160(x), r1=180(y), r2=94(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 180
LDI r2, 94
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
