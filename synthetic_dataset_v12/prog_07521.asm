; DESCRIPTION: Renders a purple box of size 113x39 starting at (152, 30).
; PLAN: r0=152(x), r1=30(y), r2=113(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 30
LDI r2, 113
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
