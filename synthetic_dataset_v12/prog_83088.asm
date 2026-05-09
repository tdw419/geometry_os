; DESCRIPTION: Renders a purple box of size 113x117 starting at (305, 3).
; PLAN: r0=305(x), r1=3(y), r2=113(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 3
LDI r2, 113
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
