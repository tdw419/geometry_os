; DESCRIPTION: Renders a purple box of size 32x23 starting at (175, 146).
; PLAN: r0=175(x), r1=146(y), r2=32(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 146
LDI r2, 32
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
