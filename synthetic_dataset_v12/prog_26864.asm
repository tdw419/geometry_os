; DESCRIPTION: Renders a purple box of size 50x33 starting at (294, 172).
; PLAN: r0=294(x), r1=172(y), r2=50(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 172
LDI r2, 50
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
