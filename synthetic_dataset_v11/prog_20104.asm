; DESCRIPTION: Renders a purple box of size 120x25 starting at (46, 125).
; PLAN: r0=46(x), r1=125(y), r2=120(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 125
LDI r2, 120
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
