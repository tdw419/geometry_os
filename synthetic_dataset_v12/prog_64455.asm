; DESCRIPTION: Renders a green box of size 32x16 starting at (18, 160).
; PLAN: r0=18(x), r1=160(y), r2=32(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 160
LDI r2, 32
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
