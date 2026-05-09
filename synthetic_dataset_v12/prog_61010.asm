; DESCRIPTION: Places a purple 98x46 rectangle at position (71, 92).
; PLAN: r0=71(x), r1=92(y), r2=98(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 92
LDI r2, 98
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
