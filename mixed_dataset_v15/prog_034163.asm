; DESCRIPTION: Renders a purple box of size 108x44 starting at (365, 117).
; PLAN: r0=365(x), r1=117(y), r2=108(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 117
LDI r2, 108
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
