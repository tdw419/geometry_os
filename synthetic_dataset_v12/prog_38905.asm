; DESCRIPTION: Renders a green box of size 103x67 starting at (371, 99).
; PLAN: r0=371(x), r1=99(y), r2=103(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 99
LDI r2, 103
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
