; DESCRIPTION: Renders a purple box of size 117x59 starting at (210, 171).
; PLAN: r0=210(x), r1=171(y), r2=117(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 171
LDI r2, 117
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
