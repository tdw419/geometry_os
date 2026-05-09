; DESCRIPTION: Renders a purple box of size 94x120 starting at (217, 57).
; PLAN: r0=217(x), r1=57(y), r2=94(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 57
LDI r2, 94
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
