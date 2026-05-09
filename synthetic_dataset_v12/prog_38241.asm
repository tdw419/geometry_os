; DESCRIPTION: Renders a green box of size 25x97 starting at (387, 133).
; PLAN: r0=387(x), r1=133(y), r2=25(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 133
LDI r2, 25
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
