; DESCRIPTION: Renders a purple box of size 83x77 starting at (422, 28).
; PLAN: r0=422(x), r1=28(y), r2=83(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 28
LDI r2, 83
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
