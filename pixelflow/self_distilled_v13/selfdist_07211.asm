; DESCRIPTION: Creates a purple filled rectangle of size 72x76 starting at (350, 46).
; PLAN: r0=350(x), r1=46(y), r2=72(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 46
LDI r2, 72
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
