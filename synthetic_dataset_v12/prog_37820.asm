; DESCRIPTION: Renders a purple box of size 44x116 starting at (210, 125).
; PLAN: r0=210(x), r1=125(y), r2=44(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 125
LDI r2, 44
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
