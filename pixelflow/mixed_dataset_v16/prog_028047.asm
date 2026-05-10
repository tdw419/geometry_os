; DESCRIPTION: Renders a green box of size 15x16 starting at (392, 216).
; PLAN: r0=392(x), r1=216(y), r2=15(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 216
LDI r2, 15
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
