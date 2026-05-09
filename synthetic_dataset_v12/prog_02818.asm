; DESCRIPTION: Renders a purple box of size 98x64 starting at (337, 91).
; PLAN: r0=337(x), r1=91(y), r2=98(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 91
LDI r2, 98
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
