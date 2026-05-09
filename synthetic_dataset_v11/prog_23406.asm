; DESCRIPTION: Renders a green box of size 22x120 starting at (32, 127).
; PLAN: r0=32(x), r1=127(y), r2=22(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 127
LDI r2, 22
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
